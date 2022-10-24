//
//  YoutubePlayer.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI
import YouTubePlayerKit

struct YoutubePlayer: View {
    var youtubePlayer: YouTubePlayer
    
    init(_ youtubeKey: String) {
        youtubePlayer = YouTubePlayer(
            source: .video(id: youtubeKey),
            configuration: .init(
                autoPlay: false,
                showControls: true
            )
        )
    }
    
    var body: some View {
        YouTubePlayerView(youtubePlayer)
    }
}
