//
//  ApiClient.swift
//  calender
//
//  Created by Ikai Masahiro on 2017/12/17.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

class ApiClient {
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func send<Request: ApiRequest> (
        request: Request,
        compiletion: @escaping (Result<Request.Response, ApiClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
            switch (data, response, error) {
            case (_, _, let error?):
                compiletion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    compiletion(Result(value: response))
                } catch let error as APIError {
                    compiletion(Result(error: .apiError(error)))
                } catch {
                    compiletion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination\(String(describing: data)), \(String(describing: response)), \(String(describing: error))")
            }
        }
        
        task.resume()
    }
}
