//
//  JSONDecodable.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/19.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
