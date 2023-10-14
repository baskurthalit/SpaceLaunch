//
//  LinksModel.swift
//  SpaceLaunch
//
//  Created by Halit Baskurt on 14.10.2023.
//

import Foundation


struct LinksModel: Codable {
    let patch: PatchModel?
    let reddit: RedditModel?
    let flickr: FlickrModel?
    let webcast: String?
    let youtubeId: String?
    let article: String?
    let wikipedia: String?
}
