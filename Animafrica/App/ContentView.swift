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
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn = 1
	@State private var toolBarIcon = "square.grid.2x2"
	@State private var isGridViewActive = false
	
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
		gridColumn = gridLayout.count
		// toolbar image
		switch gridColumn {
		case 1:
			toolBarIcon = "square.grid.2x2"
		case 2:
			toolBarIcon = "square.grid.3x2"
		case 3:
			toolBarIcon = "rectangle.grid.1x2"
		default:
			toolBarIcon = "square.grid.2x2"
		}
	}
	
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
						AboutView()
							.modifier(CenterModifier())
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
						// List
						Button {
							isGridViewActive = false
							haptics.impactOccurred()
						} label: {
							Image(systemName: "square.fill.text.grid.1x2")
								.font(.title3)
								.foregroundColor(isGridViewActive ? .primary : .accentColor)
						}
						// Grid
						Button {
							print("Grid")
							isGridViewActive = true
							haptics.impactOccurred()
							gridSwitch()
						} label: {
							Image(systemName: toolBarIcon)
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
