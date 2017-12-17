//
//  ApiClientError.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/21.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

enum ApiClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(Error)
}
