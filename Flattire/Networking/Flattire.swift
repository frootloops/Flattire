//
//  Flattire.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 10/07/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import Foundation
import CoreLocation
import Moya
import PhoneNumberKit

enum Flattire {
    case TokenRequest(PhoneNumber), Token(String), Location(CLLocationCoordinate2D)
}

extension Flattire: TargetType {
    // MARK: TargetType
    
    var baseURL: NSURL {
        guard let url = NSURL(string: "http://localhost:3000/api/v1") else {
            fatalError("baseURL not found")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .TokenRequest(_): return "/token/request"
        case .Token(_): return "/token"
        case .Location(_): return "/location"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .TokenRequest(_), .Token(_), .Location(_):
            return .POST
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        case .TokenRequest(let phone): return ["phone": phone.toE164()]
        case .Token(let code): return ["code": code]
        case .Location(let location): return [ "latitude": location.latitude, "longitude": location.longitude ]
        }
    }
    
    var sampleData: NSData {
        return "[{\"id\": \"FN-2187\"}]".dataUsingEncoding(NSUTF8StringEncoding)!
    }
}
