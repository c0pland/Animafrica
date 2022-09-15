//
//  AboutView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 14.09.22.
//

import SwiftUI

struct AboutView: View {
	var body: some View {
		VStack {
			Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 128, height: 128)
			Text("""
 Copyright © Bogdan Benner
 linkedin.com/in/bennerbr
 github.com/c0pland
 """)
			.font(.footnote)
			.multilineTextAlignment(.center)
		}
		.padding()
		.opacity(0.4)
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
