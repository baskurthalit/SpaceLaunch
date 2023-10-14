//
//  EndpointType.swift
//  RefikAPP
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


public enum EndpointType: Int {
    case test = 0
    case staging = 1
    case prod = 2
    
    var baseURL: String {
        switch self {
        case .prod: return ""
        case .test: return "api.spacexdata.com"
        default: return ""
        }
    }
    
    var scheme: String {
        switch self {
        case .prod:
            return "https"
        default:
            return "https"
        }
    }
    
    var port: Int? {
        switch self {
        default: return nil
        }
    }
}
