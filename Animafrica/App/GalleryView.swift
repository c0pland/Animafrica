//
//  GalleryView.swift
//  Animafrica
//
//  Created by Богдан Беннер on 6.09.22.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			Text("Gallery")
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
