//
//  AppError.swift
//  Yammie
//
//  Created by Vadim Kononenko on 31.01.2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "UNKNOWN ERROR"
        case .invalidUrl:
            return "Invalid URL, make sure you are using correct URL"
        case .serverError(let error):
            return error
        }
    }
}
