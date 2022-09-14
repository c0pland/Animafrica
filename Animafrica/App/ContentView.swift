//
//  ContentView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 5.09.22.
//

import SwiftUI

struct ContentView: View {
	let animals: [Animal] = Bundle.main.decode("animals.json")
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
	@State private var isGridViewActive = false
	
    var body: some View {
		NavigationView {
			Group {
				if !isGridViewActive {
					List {
						CoverImageView()
							.frame(height: 300)
							.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
						ForEach(animals) { animal in
							NavigationLink(destination: AnimalDetailView(animal: animal)) {
								AnimalListItemView(animal: animal)
							}
						}
					}
				} else {
					ScrollView(.vertical, showsIndicators: false) {
						LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetailView(animal: animal)) {
									AnimalGridItemView(animal: animal)
								}
							}
						}
						.padding(10)
						.animation(.easeIn)
					}
				}
			}
			.navigationTitle("Africa")
			.navigationBarTitleDisplayMode(.large)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack(spacing: 16) {
						Button {
							print("List")
								isGridViewActive = false
							haptics.impactOccurred()
						} label: {
							Image(systemName: "square.fill.text.grid.1x2")
								.font(.title3)
								.foregroundColor(isGridViewActive ? .primary : .accentColor)
						}
						Button {
							print("Grid")
							isGridViewActive = true
							haptics.impactOccurred()
						} label: {
							Image(systemName: "square.grid.2x2")
								.font(.title3)
								.foregroundColor(isGridViewActive ? .accentColor : .primary)
						}

					}
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
