//
//  InsetFactView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 10.09.22.
//

import SwiftUI

struct InsetFactView: View {
	let animal: Animal
    var body: some View {
		GroupBox {
			TabView {
				ForEach(animal.fact, id: \.self) { item in
					Text(item)
				}
			}
			.tabViewStyle(PageTabViewStyle())
			.frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
		}
    }
}

struct InsetFactView_Previews: PreviewProvider {
	static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[4])
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
