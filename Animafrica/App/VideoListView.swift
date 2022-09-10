//
//  VideoListView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 6.09.22.
//

import SwiftUI

struct VideoListView: View {
	@State var videos: [Video] = Bundle.main.decode("videos.json")
	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
		NavigationView {
			List {
				ForEach(videos) { item in
					VideoListItemView(video: item)
						.padding(.vertical, 8)
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Videos")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						videos.shuffle()
						hapticImpact.impactOccurred()
					} label: {
						Image(systemName: "arrow.2.squarepath")
					}
				}
			}
		}
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
