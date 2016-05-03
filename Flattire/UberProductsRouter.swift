//
//  UberRouter.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 17/04/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

enum UberProductsRouter: URLRequestConvertible {
    static let baseURLString = "https://api.uber.com/v1"
    static let serverToken = "bmVc0HenK0-Nd1w3mrHN_p1WOn3AmJzD3MDQnXxi"
    
    case Get(CLLocationDegrees, CLLocationDegrees)
    
    var method: Alamofire.Method {
        return .GET
    }
    
    var parameters: [String: AnyObject] {
        switch self {
        case .Get(let latitude, let longitude):
            return ["latitude": latitude, "longitude": longitude]
        }
    }
    
    private var path: String {
        switch self {
        case .Get: return "/products"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        guard let URL = NSURL(string: UberProductsRouter.baseURLString) else { fatalError() }
        let request = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        request.HTTPMethod = method.rawValue
        request.setValue("Token \(UberProductsRouter.serverToken)", forHTTPHeaderField: "Authorization")
        
        let encoding = Alamofire.ParameterEncoding.URL
        return encoding.encode(request, parameters: parameters).0
    }
}