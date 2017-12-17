//
//  ApiRequest.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/19.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

protocol ApiRequest {
    associatedtype Response: JSONDecodable
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Any? { get }
}

extension ApiRequest {
    
    func buildURLRequest() -> URLRequest {
        let url = URL(string:path) ?? URL(string:"")
        print(url ?? "")
        var components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        
        switch method {
        case .get:
            let dictionary = parameters as? [String: Any]
            let queryItems = dictionary?.map { key, value in
            return URLQueryItem (
                name: key,
                value: String(describing: value)
            )
        }
        components?.queryItems = queryItems
        default:
            fatalError("unsupported methed \(method)")
        }
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try Response(json: json)
        } else {
            fatalError()
        }
    }
}
