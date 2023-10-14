//
//  RocketLaunchModel.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation

struct RocketLaunchModel: Codable, Identifiable {
    let fairings: FairingsModel?
    let links: LinksModel?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool?
    let window: String?
    let rocket: String?
    let success: Bool?
    let failures: [String]?
    let details: String?
    let crew: [String]?
    let ships: [String]?
    let capsules: [String]?
    let payloads: [String]?
    let launchpad: String?
    let flightNumber: Int?
    let name: String?
    let dateUTC: String?
    let dateUnix: Int?
    let dateLocal: String?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [CoreModel]?
    let autoUpdate: Bool?
    let tbd: Bool?
    let launchLibraryId: String?
    let id: String?
}
