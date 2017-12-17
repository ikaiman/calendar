//
//  SearchResponse.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/20.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

struct SearchResponse<jsonItem: JSONDecodable>: JSONDecodable {
    let totalCount: Int
    let items: [jsonItem]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let itemCount = dictionary["count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "count", actualValue: dictionary["count"])
        }
        
        guard let itemObject = dictionary["items"] as? [[String: Any]] else {
            throw JSONDecodeError.missingValue(key: "items", actualValue: dictionary["items"])
        }
        
        self.totalCount = itemCount
        self.items = try itemObject.map {
            return try jsonItem(json: $0)
        }
    }
}
