//
//  VideoPlayerViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 23.04.2026.
//

import Foundation
import AVKit
import CoreMedia

final class VideoPlayerViewController: UIViewController {
    
    private let playerView = VideoPlayerView()
    private var player: AVPlayer?
    private var isPlaying: Bool = false
    private var timerObserverToken: Any?
    private var hideControlsWorkItem: DispatchWorkItem?
    
        
    override func loadView() {
        self.view = playerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Setting category to AVAudioSessionCategoryPlayback failed.")
            }
        
        setupPlayer()
        setupActions()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleViewTap))
        view.addGestureRecognizer(tapGesture)
        
        resetHideTimer()
        
    }
    
    //MARK: Tap to show controls UI
    
    @objc func handleViewTap() {
        if playerView.controlsContainer.alpha == 0 {
            showUI()
        } else {
            resetHideTimer()
        }
    }
    
    private func showUI() {
        hideControlsWorkItem?.cancel()
        
        UIView.animate(withDuration: 0.3) {
            self.playerView.controlsContainer.alpha = 1
        }
        resetHideTimer()
    }
    
    @objc private func hideUI() {
        guard isPlaying else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.playerView.controlsContainer.alpha = 0
        }
    }
    
    private func resetHideTimer() {
        hideControlsWorkItem?.cancel()
        
        let task = DispatchWorkItem { [weak self] in
            self?.hideUI()
        }
        hideControlsWorkItem = task
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let token = timerObserverToken {
            player?.removeTimeObserver(token)
            timerObserverToken = nil
        }
    }
    //MARK: Player setup
    
    func setupPlayer() {
        guard let path = Bundle.main.path(forResource: "myVideo", ofType: "mp4") else {
            print("Video file not found in bundle")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        playerView.playerLayer.player = player
        
        addTimeObserver()
        
        player?.automaticallyWaitsToMinimizeStalling = true
    }
    
    //MARK: Controls
    
    private func setupActions() {
        playerView.playPauseButton.addTarget(self, action: #selector(togglePlayback), for: .touchUpInside)
        playerView.closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        playerView.minimizeButton.addTarget(self, action: #selector(minimizeTapped), for: .touchUpInside)
        
        playerView.forwardButton.addTarget(self, action: #selector(skipForward), for: .touchUpInside)
        playerView.backwardButton.addTarget(self, action: #selector(skipBackward), for: .touchUpInside)
        
        playerView.timerSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        playerView.timerSlider.addTarget(self, action: #selector(sliderTouchStarted), for: .touchDown)
        playerView.timerSlider.addTarget(self, action: #selector(sliderTouchEnded), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc private func togglePlayback() {
        guard let player = player else { return }
        print("Button tapped! isPlaying currently: \(isPlaying)")
        
        if isPlaying {
            player.pause()
            hideControlsWorkItem?.cancel() //When paused UI is visible
            
            let image = UIImage(systemName: "play.fill")?.withRenderingMode(.alwaysOriginal)
            playerView.playPauseButton.setImage(image, for: .normal)
            playerView.playPauseButton.tintColor = .white
        } else {
            player.play()
            resetHideTimer() //Timer to hide
            
            let image = UIImage(systemName: "pause.fill")?.withRenderingMode(.alwaysOriginal)
            playerView.playPauseButton.setImage(image, for: .normal)
            playerView.playPauseButton.tintColor = .white
        }
        
        isPlaying.toggle()
    }
    
    @objc private func skipForward(){
        guard let player = player else { return }
        let currentTime = player.currentTime()
        let newTimer = CMTimeAdd(currentTime, CMTimeMakeWithSeconds(10, preferredTimescale: 600))
        player.seek(to: newTimer)
    }
    
    @objc private func skipBackward(){
        guard let player = player else { return }
        let currentTime = player.currentTime()
        let newTimer = CMTimeSubtract(currentTime, CMTimeMakeWithSeconds(10, preferredTimescale: 600))
        player.seek(to: newTimer)
    }
    
    //MARK: Slider
    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.5, preferredTimescale: 600)
        
        timerObserverToken = player?.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self = self, let duration = self.player?.currentItem?.duration else { return }
            
            let totalSeconds = CMTimeGetSeconds(duration)
            let currentSeconds = CMTimeGetSeconds(time)
            
            if totalSeconds > 0 && !totalSeconds.isNaN {
                if !self.playerView.timerSlider.isTracking {
                self.playerView.timerSlider.value = Float(currentSeconds / totalSeconds)
            }
                self.playerView.currentTimeLabel.text = self.formatTimer(currentSeconds)
                self.playerView.durationLabel.text = self.formatTimer(totalSeconds)
            }
        }
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        guard let duration = player?.currentItem?.duration else { return }
        let totalSeconds = CMTimeGetSeconds(duration)
        let value = Float64(sender.value) * totalSeconds
        let seekTime = CMTime(value: Int64(value * 600), timescale: 600)
        
        player?.seek(to: seekTime, toleranceBefore: .zero, toleranceAfter: .zero)
        playerView.currentTimeLabel.text = formatTimer(value)
    }
    
    func formatTimer(_ seconds: Double) -> String {
        if seconds .isNaN || seconds.isInfinite { return "00:00" }
        let minutes = Int(seconds) / 60
        let secondsInt = Int(seconds) % 60
        let secondsString = secondsInt < 10 ? "0\(secondsInt)" : "\(secondsInt)"
        return "\(minutes):\(secondsString)"
    }
    
    //Avoiding slider to dissaper
    @objc private func sliderTouchStarted() {
        hideControlsWorkItem?.cancel()
    }

    @objc private func sliderTouchEnded() {
        resetHideTimer()
    }
    
    //MARK: Navigation
    
    @objc private func closeTapped() {
        player?.pause()
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func minimizeTapped() {
        print("Minimize tapped! Ready for custom transition.")
    }
    
    //MARK: Screen orientation
    
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
