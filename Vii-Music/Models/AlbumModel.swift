//
//  AlbumModel.swift
//  Vii-Music
//
//  Created by Alexander Altman on 17.01.2023.
//

import Foundation

struct AlbumModel: Decodable {
    let results: [ResultsAlbum]
}

struct ResultsAlbum: Decodable {
    let collectionId: Int // id для перехода к трекам альбома
    let artistName: String // Название артиста
    let artworkUrl100: String? // Картинка альбома 100 * 100
    let trackCount: Int // тайминг трека
    let collectionName: String
    
}
