//
//  Tracks.swift
//  Vii-Music
//
//  Created by Alexander Altman on 17.01.2023.
//

import Foundation

struct TrackModel: Decodable {
    let results: [Tracks]
}

struct Tracks: Decodable {
    let artistName: String
    let collectionName: String
    let trackName: String
    let trackTimeMillis: Int
    let artworkUrl100: String?
    let previewUrl: String?
}
