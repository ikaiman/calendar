//
//  Item.swift
//  newpublication
//
//  Created by Ikai Masahiro on 2017/06/19.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

class Item: NSObject, JSONDecodable {
    let author: String
    let publishDate: String
    
    let keyAuthor = "author"
    let keyPublishDate = "publishDate"
    
    required init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        guard let author = dictionary[keyAuthor] as? String else{
            throw JSONDecodeError.missingValue(key: keyAuthor, actualValue: dictionary[keyAuthor])
        }
        guard let publishDate = dictionary[keyPublishDate] as? String else{
            throw JSONDecodeError.missingValue(key: keyPublishDate, actualValue: dictionary[keyPublishDate])
        }
        
        self.author = author
        self.publishDate = publishDate
    }
}
