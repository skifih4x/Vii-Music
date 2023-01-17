//
//  MusicManager.swift
//  Vii-Music
//
//  Created by Alexander Altman on 17.01.2023.
//

import Foundation

protocol MusicManagerDelegate: AnyObject {
    func didUpdateMusic(_ musicManager: MusicManager, music: [Music])
    func didFailWithError(error: Error)
}

struct MusicManager {
    
    weak var delegate: MusicManagerDelegate?
    
    func performRequest() {
        if let url = URL(string: musicURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    print(safeData)
                    if let music = self.parseJSON(safeData) {
                        self.delegate?.didUpdateMusic(self, music: music)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [Music]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(MusicData.self, from: data)
            print(decodeData)
            let music = decodeData.results
            print(music)
            return music
        } catch {
            delegate?.didFailWithError(error: error)
            print(String(describing: error))
            return nil
        }
    }
}
