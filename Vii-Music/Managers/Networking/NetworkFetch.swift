//
//  NetworkFetch.swift
//  Vii-Music
//
//  Created by Alexander Altman on 17.01.2023.
//

import Foundation

struct NetworkFetch {
    
    static let shared = NetworkFetch()
    
    func albumFetchArtists(completion: @escaping (Result<AlbumModel, Error> ) -> Void ) {
        
        // artists ID's and AMG artist ID's
        // Metallica - 3996865 _ 4906
        // Nirvana - 112018 _ 5034
        // Pink Floyd - 487143 _ 76669
        //
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=metallica&entity=album&attribute=albumTerm") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(AlbumModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func songFetch(urlString: String, response: @escaping (TrackModel?, Error?) -> Void) {
        DataFetch.shared.fetchData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(TrackModel.self, from: data)
                    response(results, nil )
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error fetching song data: \(error.localizedDescription)")
                response(nil, error )
            }
        }
    }
    
    
    func albumFetch(urlString: String, response: @escaping (AlbumModel?, Error?) -> Void) {
        DataFetch.shared.fetchData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(AlbumModel.self, from: data)
                    response(results, nil )
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error fetching song data: \(error.localizedDescription)")
                response(nil, error )
            }
        }
    }
    
    
    
}
