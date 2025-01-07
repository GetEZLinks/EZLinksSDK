//
//  EZLinksError.swift
//  EZLinksSDK
//
//  Created by Rupesh Pandey on 1/4/25.
//


enum EZLinksError: Error {
    case invalidURL
    case noData
    case decodingError
    case networkError(Error)
}
