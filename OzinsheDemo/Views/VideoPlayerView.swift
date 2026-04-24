//
//  PlayView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 18.04.2026.
//

import UIKit
import AVFoundation
import SnapKit

class VideoPlayerView: UIView {
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer : AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    //MARK: UI elements
    
    let controlsContainer = UIView()
    
    lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.maximumTrackTintColor = .white.withAlphaComponent(0.4)
        slider.minimumTrackTintColor = UIColor(named: "7E2DFC")
        slider.thumbTintColor = UIColor(named: "7E2DFC")
        return slider
    }()
    
    lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "00:00"
        label.font = UIFont(name:"SFProDisplay-Regular", size: 12)
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "00:00"
        label.font = UIFont(name:"SFProDisplay-Regular", size: 12)
        return label
    }()
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Қызғалдақтар мекені"
        label.font = UIFont(name:"SFProDisplay-Bold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var seriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "1 серия"
        label.font = UIFont(name:"SFProDisplay-Semibold", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    lazy var playPauseButton = createCustomButton(icon: "Video-Play-Button")
    lazy var forwardButton = createCustomButton(icon: "Video-forward-10")
    lazy var backwardButton = createCustomButton(icon: "Video-backward-10")
    lazy var minimizeButton: UIButton = createCustomButton(icon: "Video-Minimize-Icon")
    lazy var closeButton: UIButton = createCustomButton(icon: "Video-Close-Icon")
    
    lazy var controlStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backwardButton, playPauseButton, forwardButton])
        stack.axis = .horizontal
        stack.spacing = 40
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCustomButton(icon: String) -> UIButton {
        let button = UIButton(type: .system)
        let image = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }
    
    private func setupUI() {
        backgroundColor = .black
        playerLayer.videoGravity = .resizeAspect
        
        addSubview(controlsContainer)
        
        controlsContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        controlsContainer.addSubview(minimizeButton)
        controlsContainer.addSubview(closeButton)
        controlsContainer.addSubview(timerSlider)
        controlsContainer.addSubview(controlStack)
        controlsContainer.addSubview(titleLabel)
        controlsContainer.addSubview(seriesLabel)
        controlsContainer.addSubview(currentTimeLabel)
        controlsContainer.addSubview(durationLabel)
        
        
        minimizeButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.right.equalToSuperview().inset(24)
            make.size.equalTo(40)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(24)
            make.size.equalTo(40)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        seriesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        controlStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        timerSlider.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).inset(24)
            make.right.equalTo(durationLabel.snp.left).offset(-16)
        }
        
        durationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timerSlider)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(24)
        }
        
        currentTimeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(timerSlider.snp.top)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(24)
        }
    }
}
