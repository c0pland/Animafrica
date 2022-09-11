//
//  LocationModel.swift
//  Animafrica
//
//  Created by Богдан Беннер on 11.09.22.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
	var id: String
	var name: String
	var image: String
	var latitude: Double
	var longitude: Double
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
