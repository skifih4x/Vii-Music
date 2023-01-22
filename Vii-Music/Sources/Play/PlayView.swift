//
//  PlayView.swift
//  Vii-Music
//
//  Created by Sergio on 15.01.23.
//

import UIKit

final class PlayView: UIView {

    //MARK: - UIElements
    let dragDownButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let backTrackButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextTrackButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = UIColor(named: "lightBlue")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

     lazy var logoTrack: UIImageView = {
        let image = UIImage(named: "logoBackground")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var playingNowLabel = UILabel(text: "Playing Now", size: 16, textColor: .white)

    lazy var trackLabel = UILabel(text: "Adiyee",size: 22, textColor: .white)

    lazy var artistLabel = UILabel(text: "Name", size: 14, textColor: .white)

    lazy var timePassedLabel = UILabel(text: "0:00",size: 11, textColor: .white)

    lazy var timeLeftLabel = UILabel(text: "0:00", size: 11, textColor: .white)

    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = UIColor(named: "lightBlue")
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = UIColor(named: "lightBlue")
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    let backgroundPlayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor(named: "lightBlue")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - LifeCycle

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "background1")
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup

    private func setupHierarchy() {
        addSubview(logoTrack)
        addSubview(backTrackButton)
        addSubview(nextTrackButton)
        addSubview(likeButton)
        addSubview(playingNowLabel)
        addSubview(trackLabel)
        addSubview(artistLabel)
        addSubview(timePassedLabel)
        addSubview(timeLeftLabel)
        addSubview(slider)
        addSubview(backgroundPlayImage)
        addSubview(playButton)
        addSubview(dragDownButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            dragDownButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            dragDownButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            playingNowLabel.topAnchor.constraint(equalTo: dragDownButton.bottomAnchor, constant: 25),
            playingNowLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            logoTrack.topAnchor.constraint(equalTo: playingNowLabel.bottomAnchor, constant: 25),
            logoTrack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            logoTrack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55),
            logoTrack.heightAnchor.constraint(equalToConstant: 340),

            backgroundPlayImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
            backgroundPlayImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundPlayImage.heightAnchor.constraint(equalToConstant: 60),
            backgroundPlayImage.widthAnchor.constraint(equalToConstant: 60),

            playButton.centerXAnchor.constraint(equalTo: backgroundPlayImage.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: backgroundPlayImage.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 50),
            playButton.heightAnchor.constraint(equalToConstant: 50),

            backTrackButton.trailingAnchor.constraint(equalTo: backgroundPlayImage.leadingAnchor, constant: -38),
            backTrackButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140),
            backTrackButton.widthAnchor.constraint(equalToConstant: 40),
            backTrackButton.heightAnchor.constraint(equalToConstant: 40),

            nextTrackButton.leadingAnchor.constraint(equalTo: backgroundPlayImage.trailingAnchor, constant: 38),
            nextTrackButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140),
            nextTrackButton.widthAnchor.constraint(equalToConstant: 40),
            nextTrackButton.heightAnchor.constraint(equalToConstant: 40),

            slider.bottomAnchor.constraint(equalTo: backgroundPlayImage.topAnchor, constant: -60),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

            timePassedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            timePassedLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),

            timeLeftLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            timeLeftLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 5),

            artistLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -20),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),

            trackLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: -10),
            trackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),

            likeButton.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -28),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),

        ])
    }
}
