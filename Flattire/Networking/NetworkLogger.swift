//
//  NetworkLogger.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 10/07/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import Foundation
import Moya
import Result

class NetworkLogger: PluginType {
    
    func willSendRequest(request: RequestType, target: TargetType) {
        let url = request.request?.URL?.absoluteString ?? String()
        print("Sending request: \(url)")
    }
    
    func didReceiveResponse(result: Result<Moya.Response, Moya.Error>, target: TargetType) {
        switch result {
        case .Success(let response):
            let url = response.response?.URL?.absoluteString ?? String()
            print("Received response(\(response.statusCode ?? 0)) from \(url).")
        case .Failure(let error):
            print("Received networking error: \(error)")
        }
    }
}
