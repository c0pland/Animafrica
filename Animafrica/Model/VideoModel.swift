//
//  VideoModel.swift
//  Animafrica
//
//  Created by Богдан Беннер on 10.09.22.
//

import Foundation

struct Video: Codable, Identifiable {
	let id: String
	let name: String
	let headline: String
	var thumbnailImage: String {
		"video-\(self.id)"
	}
}
