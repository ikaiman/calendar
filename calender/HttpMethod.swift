//
//  HttpMethod.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/19.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
}
