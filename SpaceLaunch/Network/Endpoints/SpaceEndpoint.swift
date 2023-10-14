//
//  SpaceEndpoint.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


enum SpaceEndpoint : Endpoint, EndpointMakers {
    case latestLaunch
    case nextLaunch
    
    var path: String { pathMaker() }
    
    var parameters: [String : Any]? { paramsMaker() }
    
    var type: RequestType { requestTypeMaker() }
    
    var header: [String : Any] { headerMaker() }
    
    func pathMaker(
    ) -> String {
        switch self {
        case .latestLaunch: return "v4/launches/latest"
        case .nextLaunch: return "v4/launches/next"
        }
    }
    
    func paramsMaker(
    ) -> [String : Any]? {
        return nil
    }
    
    func requestTypeMaker(
    ) -> RequestType {
        switch self {
        case .latestLaunch: return .GET
        case .nextLaunch: return .GET
        }
    }
    
    func headerMaker(
    ) -> [String : Any] {
        return [:]
    }
    
}
