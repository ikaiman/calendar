//
//  JSONDecodeError.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/19.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error {
    case invalidFormat(json:Any)
    case missingValue(key: String, actualValue:Any?)
}
