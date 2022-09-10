//
//  ExternalWeblinkView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 10.09.22.
//

import SwiftUI

struct ExternalWeblinkView: View {
	let animal: Animal
    var body: some View {
		GroupBox {
			HStack {
				Image(systemName: "globe")
				Text("Wikipedia")
				Spacer()
				Group {
					Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
					Image(systemName: "arrow.up.right.square")
				}
				.foregroundColor(.accentColor)
			}
		}
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[1])
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
