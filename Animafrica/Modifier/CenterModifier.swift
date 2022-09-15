//
//  CenterModifier.swift
//  Animafrica
//
//  Created by Богдан Беннер on 15.09.22.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		HStack {
			Spacer()
			content
			Spacer()
		}
	}
}
