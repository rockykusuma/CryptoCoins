//
//  APIServiceImpl.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

class CoinsServiceImpl: CoinsService {
    
    let apiHandler: APIHandler
    
    init(apiHandler: APIHandler = APIHandlerImpl()) {
        self.apiHandler = apiHandler
    }
    
    func fetchCoins() async throws -> [Coin]? {
        guard let url = Endpoint.getCoins.requestURL else {
            throw CustomError.invalidURL
        }
        return try await apiHandler.fetchRequest(type: [Coin].self, url: url)
    }
}

class CoinsServiceMockable: CoinsService {
    
    func fetchCoins() async throws -> [Coin]? {
        return FileUtility.loadJsonFile(type: [Coin].self, fileName: "coins")
    }
}
