//
//  EndpointMakers.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation

protocol EndpointMakers {
    func pathMaker() -> String
    func paramsMaker() -> [String : Any]?
    func requestTypeMaker() -> RequestType
    func headerMaker() -> [String:Any]
}

