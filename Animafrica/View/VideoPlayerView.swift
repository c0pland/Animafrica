//
//  VidePlayerView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 10.09.22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	var videoSelected: String
	var videoTitle: String
    var body: some View {
		VStack() {
			VideoPlayer(player: playVideo(filename: videoSelected, fileFormat: "mp4")) {
				
			}
			.overlay(
			Image("logo")
				.resizable()
				.scaledToFit()
				.frame(width: 32, height: 32)
				.padding(.top, 6)
				.padding(.horizontal, 8)
			, alignment: .topLeading
			)
		}
		.accentColor(.accentColor)
		.navigationTitle(videoTitle)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct VidePlayerView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
		}
    }
}
