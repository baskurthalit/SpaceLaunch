//
//  Endpoint.swift
//  RefikAPP
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var parameters: [String : Any]? { get }
    var type: RequestType { get }
    var header: [String : Any] { get }
}

extension Endpoint {
    var base: String { EndpointManager.endpoint.baseURL }
    var scheme: String { EndpointManager.endpoint.scheme }
    var port: Int? { EndpointManager.endpoint.port }
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = base
        components.port = port
        
        var fullPath = path
        fullPath = "/".appending(path)
        
        components.path = fullPath
        
        return components
    }
}
