//
//  EndpointManager.swift
//  RefikAPP
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


struct EndpointManager {
    static var endpoint : EndpointType { getEndpoint() }
    
    private static func getEndpoint() -> EndpointType { .test }
}
