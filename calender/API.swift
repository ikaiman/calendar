//
//  API.swift
//  calender
//
//  Created by Ikai Masahiro on 2017/12/17.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import Foundation

final class API {
    struct SearchItems: ApiRequest {
        typealias Response = SearchResponse<Item>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "https://asamaki.github.io/nifty-adventcal2017/items.json"
        }
        
        var parameters: Any? {
            return nil
        }
    }
}
