//
//  RequestResult.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


enum SpaceRequestResult<T> {
    case success(result: T)
    case error(_: Error)
}

typealias SpaceRequestHandler<T> = (SpaceRequestResult<T>) -> Void
