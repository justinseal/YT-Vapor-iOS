//
//  SongListViewModel.swift
//  YT-Vabor
//
//  Created by Justin Seal on 5/13/25.
//

import Foundation

class SongListViewModel: ObservableObject {
    @Published var songs = [Song]()
    
    func fetchSongs() async throws {
        let urlString = Constants.baseURL + Endpoint.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        do {
            let songResponse: [Song] = try await HttpClient.shared.fetch(url: url)
            songs = songResponse
        } catch {
            throw HttpError.badResponse
        }
    }
    
}
