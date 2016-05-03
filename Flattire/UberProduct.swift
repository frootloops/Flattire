//
//  UberProduct.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 03/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import Foundation
import ObjectMapper

struct UberProduct {
    var productId: String = ""
    var shortDescription: String = ""
    var description: String = ""
    var displayName: String = ""
    var capacity: Int = 0
    var image: String = ""
}

extension UberProduct: Mappable {
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        productId <- map["product_id"]
        shortDescription <- map["short_description"]
        description <- map["description"]
        displayName <- map["display_name"]
        capacity <- map["capacity"]
        image <- map["image"]
    }

}