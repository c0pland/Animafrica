//
//  VideoPlayerHelper.swift
//  Animafrica
//
//  Created by Богдан Беннер on 10.09.22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?
func playVideo(filename: String, fileFormat: String) -> AVPlayer {
	if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil {
		videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
		videoPlayer?.play()
	}
	return videoPlayer!
}
