//
//  VideoPlayerViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 23.04.2026.
//

import Foundation
import AVKit

final class VideoPlayerViewController: UIViewController {
    
    private let playerView = VideoPlayerView()
    private var player: AVPlayer?
    private var isPlaying: Bool = false
    
        
    override func loadView() {
        self.view = playerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
        setupActions()
    }
    
    func setupPlayer() {
        guard let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        else {
            return
        }
        player = AVPlayer(url: url)
        playerView.playerLayer.player = player
    }
    
    private func setupActions() {
        playerView.playPauseButton.addTarget(self, action: #selector(togglePlayback), for: .touchUpInside)
    }
    
    @objc private func togglePlayback() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
            playerView.playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playerView.playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
        isPlaying.toggle()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
