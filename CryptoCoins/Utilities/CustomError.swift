//
//  CustomError.swift
//  SampleOne
//
//  Created by Rakesh Kusuma on 12/10/23.
//

import Foundation

enum CustomError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unexpected(code: Int)
}
