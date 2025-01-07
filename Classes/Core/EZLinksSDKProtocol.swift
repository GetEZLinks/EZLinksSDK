//
//  EZLinksSDKProtocol.swift
//  EZLinksSDK
//
//  Created by Rupesh Pandey on 1/4/25.
//


protocol EZLinksSDKProtocol {
    func generateShortLink(queryString: String, completion: @escaping (Result<String, Error>) -> Void)
    func getReferringParams() -> [String: Any]?
    func initialize(appName: String?)
}
