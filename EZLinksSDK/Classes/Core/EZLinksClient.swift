//
//  EZLinksSDK.swift
//  EZLinksSDK
//
//  Created by Rupesh Pandey on 1/4/25.
//

import Foundation
import Alamofire

public class EZLinksClient: EZLinksSDKProtocol {

    public static let shared = EZLinksClient()
    
    private var appName: String?
    private var baseUrl: String?
    
    private init() {}
    
    public func initialize(appName: String? = nil) {
        // Fetch app name dynamically if not provided
        self.appName = appName ?? Bundle.main.appName
        
        // Fetch base URL from associated domains
        if let baseDomain = Bundle.main.associatedDomains.first(where: { $0.starts(with: "applinks:") }) {
            self.baseUrl = baseDomain.replacingOccurrences(of: "applinks:", with: "https://")
        } else {
            print("Error: Associated domain not configured or missing.")
        }
        
        // Debug log
        print("EZLinksSDK initialized with app name: \(self.appName ?? "Unknown") and base URL: \(self.baseUrl ?? "None")")
    }
    
    
        
    public func generateShortLink(queryString: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(String(describing: baseUrl))/create-shortlink") else {
//            completion(nil, .failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = prepareShortLinkPayload(queryString: queryString)
        
        AF.request("\(String(describing: baseUrl))/create-shortlink/\(params["action"])", method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let json = data as? [String: Any], let shortLink = json["shortLink"] as? String {
                        completion(.success(shortLink))
                    } else {
//                        completion(.failure(/*<#T##any Error#>*/))
                    }
                case .failure(let err):
                    completion(.failure(err))
                }
            }

    }
    
    func getReferringParams() -> [String: Any]? {
        return ["key": "value"]
    }
}

extension EZLinksClient {
    func prepareShortLinkPayload(queryString: String) -> [String: Any] {
        var action: String = ""
        var params: [String: String] = [:]
        
        // Split into action and the rest of the query string
        let components = queryString.components(separatedBy: "?")
        if components.count > 0 {
            action = components[0] // The part before "?"
        }
        if components.count > 1 {
            let paramString = components[1] // The part after "?"
            paramString.components(separatedBy: "&").forEach { pair in
                let keyValue = pair.components(separatedBy: "=")
                if keyValue.count == 2 {
                    params[keyValue[0]] = keyValue[1]
                }
            }
        }
        
        return ["action": action, "params": params]
    }
}
