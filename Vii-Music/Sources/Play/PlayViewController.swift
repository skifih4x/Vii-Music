//
//  PlayViewController.swift
//  Vii-Music
//
//  Created by Sergio on 9.01.23.
//

import UIKit
import AVFoundation

enum Constants {
    static let minPlayTime = 3.0
    static let minute = 60
}

final class PlayViewController: UIViewController {

    // MARK: - Properties
    let manager = UserDefaultManager()
    private var player: AVPlayer!
    var bRec: Bool = true

    //MARK: - LifeCycle

    private var playView: PlayView? {
        guard isViewLoaded else { return nil }
        return view as? PlayView
    }

    override func loadView() {
        super.loadView()
        view = PlayView()
        setupTarget()
        setupPlayer()
    }

    //MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setupTarget() {
        playView?.likeButton.addTarget(self, action: #selector(addFavoriteTrack), for: .touchUpInside)
        playView?.playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        playView?.slider.addTarget(self, action: #selector(didTapSlider), for: .touchUpInside)
        playView?.backTrackButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        playView?.nextTrackButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    }

    func convertTimeToString(time: CMTime) -> String {
        guard !CMTimeGetSeconds(time).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(time))
        let seconds = totalSeconds % Constants.minute
        let minutes = totalSeconds / Constants.minute
        let timeFormatString = String(
            format: "%02d:%02d",minutes, seconds
        )
        return timeFormatString
    }

    func setupPlayer() {

        player = AVPlayer(url:URL(fileURLWithPath:Bundle.main.path(forResource:"Playboi Carti - Molly",ofType: "mp3")!))

        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self]
            (time) in

            playView?.slider.maximumValue = Float(player.currentItem?.duration.seconds ?? 0)
            playView?.slider.value = Float(time.seconds)

            playView?.timePassedLabel.text = convertTimeToString(time: time)
            playView?.timeLeftLabel.text = convertTimeToString(time: (player.currentItem?.duration ?? CMTime()) - time)
        }
    }

    @objc private func didTapPlayButton() {
        if player.timeControlStatus == .playing {
            playView?.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.pause()
        } else {
            playView?.playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            player.play()
        }
    }

    @objc private func didTapSlider() {
        player.seek(to: CMTime(seconds: Double(playView?.slider.value ?? 0),
                               preferredTimescale: 1000))
        playView?.timePassedLabel.text = "\(String(describing: playView?.slider.value))"
    }

    @objc private func addFavoriteTrack() {
        bRec = !bRec
        if bRec {
            playView?.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            playView?.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            //tap
            manager.setData(data: "Adiya")
        }
    }

    @objc private func didTapBackButton() {

    }

    @objc private func didTapNextButton() {
        
    }
}
