//
//  ProductsResponse.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 03/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductsResponse {
    var products = [UberProduct]()
    
    required init?(_ map: Map) {}
}

extension ProductsResponse: Mappable {
    // MARK: Mappable
    
    func mapping(map: Map) {
        products <- map["products"]
    }
}