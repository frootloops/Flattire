//
//  FlattireProvider.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 10/07/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import Foundation
import Moya

private func dataFormatter(data: NSData) -> NSData {
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        return try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
    } catch {
        return data
    }
}

private let plugins: [PluginType] = [NetworkLoggerPlugin(verbose: true, responseDataFormatter: dataFormatter)]
let FlattireProvider = MoyaProvider<Flattire>(plugins: plugins)
