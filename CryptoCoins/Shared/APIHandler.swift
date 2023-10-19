//
//  APIHandler.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation
import Combine


protocol APIHandler {
    func fetchRequest<T: Codable>(type: T.Type, url: URL) async throws -> T?
    func fetchRequestUsingCombine<T: Codable>(type: T.Type, url: URL) -> Future<T?, Error>
}

class APIHandlerImpl: APIHandler {
    
    private let responseHandler: ResponseHandler
    var cancellables = Set<AnyCancellable>()
    
    init(responseHandler: ResponseHandler = ResponseHandlerImpl()) {
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, url: URL) async throws -> T? {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw CustomError.invalidResponse
        }
        return try responseHandler.handleResponse(type: type, data: data)
    }
    
    func fetchRequestUsingCombine<T: Codable>(type: T.Type, url: URL) -> Future<T?, Error> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return Future { promise in
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { data, response in
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw CustomError.invalidResponse
                    }
                    return data
                }
                .decode(type: T.self, decoder: decoder)
                .sink { (completion) in
                    print("Coins completed: \(completion)")
                } receiveValue: { result in
                    promise(.success(result))
                }
                .store(in: &self.cancellables)
        }
    }
}
