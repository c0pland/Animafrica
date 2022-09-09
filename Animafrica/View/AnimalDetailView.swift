//
//  AnimalDetailView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 9.09.22.
//

import SwiftUI

struct AnimalDetailView: View {
	let animal: Animal
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 20) {
				// hero image
				Image(animal.image)
					.resizable()
					.scaledToFit()
				// title
				Text(animal.name.uppercased())
					.font(.largeTitle)
					.fontWeight(.heavy)
					.multilineTextAlignment(.center)
					.padding(.vertical, 8)
					.foregroundColor(.primary)
					.background(
						Color.accentColor
							.frame(height: 6)
							.offset(y: 24)
						)
				// headline
				Text(animal.headline)
					.font(.headline)
					.multilineTextAlignment(.leading)
					.foregroundColor(.accentColor)
					.padding(.horizontal)
				// gallery
				Group {
					HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
					InsetGalleryView(animal: animal)
				}
				.padding(.horizontal)
				// facts
				
				// description
				
				// map
				
				// link
			}
			.navigationTitle("Learn more about \(animal.name)")
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
		NavigationView {
			AnimalDetailView(animal: animals[2])
		}
    }
}