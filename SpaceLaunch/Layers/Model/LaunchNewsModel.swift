//
//  LaunchNewsModel.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


struct LaunchNewsModel : Codable, Identifiable {
    var id: String { launchType }
    let launchType: String
    let rocketLaunch: RocketLaunchModel?
}
