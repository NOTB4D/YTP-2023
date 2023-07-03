//
//  File.swift
//  Sample
//
//  Created by Eser Kucuker on 1.08.2022.
//

import Foundation

struct BookResponseModel: Codable {
    let feed: Feed?
}

struct Feed: Codable {
    let results: [Books]?
}

// MARK: - Result
struct Books: Codable {
    let artistName, id, name, releaseDate: String?
    let artistID: String?
    let artistURL: String?
    let artworkUrl100: String?
    let url: String?
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100,  url, contentAdvisoryRating
    }
}
