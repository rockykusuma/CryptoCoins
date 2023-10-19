//
//  ResponseHandler.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

protocol ResponseHandler {
    func handleResponse<T: Codable>(type: T.Type, data: Data) throws -> T?
}

class ResponseHandlerImpl: ResponseHandler {
    func handleResponse<T: Codable>(type: T.Type, data: Data) throws -> T? {
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            return result
        }
        catch {
            throw CustomError.invalidData
        }
    }
}
