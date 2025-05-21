//
//  ContentView.swift
//  YT-Vabor
//
//  Created by Justin Seal on 5/13/25.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.songs) { song in
                    Button {
                        print("Selected")
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle("🎵 Songs")
        }
        .onAppear {
            Task {
                try await viewModel.fetchSongs()
            }
        }
    }
        
}

#Preview {
    SongList()
}
