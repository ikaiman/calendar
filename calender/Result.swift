//
//  Result.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/21.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}
