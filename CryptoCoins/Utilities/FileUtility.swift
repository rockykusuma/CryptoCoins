//
//  FileUtility.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

struct FileUtility {
    static func loadJsonFile<T: Codable>(type: T.Type, fileName: String) -> T? {
        guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: path)
            let responseHandler: ResponseHandler = ResponseHandlerImpl()
            let result = try responseHandler.handleResponse(type: type, data: data)
            return result
        }
        catch(let error) {
            print("Error Decoding for the type \(type.self): \(error)")
        }
        return nil
    }
    
}
