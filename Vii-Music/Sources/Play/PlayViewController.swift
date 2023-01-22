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

protocol TrackMovingDelegate: AnyObject {
    func moveBack() -> Tracks?
    func moveNext() -> Tracks?
}

final class PlayViewController: UIViewController {

    // MARK: - Properties
    let manager = UserDefaultManager()
    private var player: AVPlayer!
    var bRec: Bool = true
    weak var delegate: TrackMovingDelegate?

    //MARK: - LifeCycle

    private var playView: PlayView? {
        guard isViewLoaded else { return nil }
        return view as? PlayView
    }

    override func loadView() {
        super.loadView()
        view = PlayView()
        setupTarget()
//        setupPlayer()
        setupGestureRecognizers()
    }

    //MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGestureRecognizers()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        playView?.playButton.setImage(UIImage(systemName: "pause"), for: .normal)
    }

    private func setupGestureRecognizers() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        downSwipe.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(downSwipe)
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupTarget() {
        playView?.likeButton.addTarget(self, action: #selector(addFavoriteTrack), for: .touchUpInside)
        playView?.playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        playView?.slider.addTarget(self, action: #selector(didTapSlider), for: .touchUpInside)
        playView?.backTrackButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        playView?.nextTrackButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        playView?.dragDownButton.addTarget(self, action: #selector(didDragDownTapped), for: .touchUpInside)
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

    func set(viewModel: Tracks) {

        let string600 = viewModel.artworkUrl100?.replacingOccurrences(of: "100x100", with: "350x350")
        guard let url = URL(string: string600 ?? "") else { return }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.playView?.trackLabel.text = viewModel.trackName
                self.playView?.artistLabel.text = viewModel.artistName
                self.playView?.logoTrack.image = UIImage(data: data)
            }
        }
        playTrack(previewUrl: viewModel.previewUrl)
//        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { [self]
//            (time) in
//
//            playView?.slider.maximumValue = Float(player.currentItem?.duration.seconds ?? 0)
////            playView?.slider.value = Float(time.seconds)
//
//            playView?.timePassedLabel.text = convertTimeToString(time: time)
//            playView?.timeLeftLabel.text = convertTimeToString(time: (player.currentItem?.duration ?? CMTime()) - time)
//        }
        observePlayerTime()
        updateCurrentTime()
    }

    func observePlayerTime() {
        let interval = CMTimeMake(value: 1, timescale: 2)
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] (time) in
            self?.playView?.timeLeftLabel.text = time.toDisplayString()

            let durationTime = self?.player.currentItem?.duration
            let currentDurationText = ((durationTime ?? CMTimeMake(value: 1, timescale: 1)) - time).toDisplayString()
            self?.playView?.timePassedLabel.text = "-\(currentDurationText)"
            self?.updateCurrentTime()
        }
    }

    func updateCurrentTime() {
        let currentTimeSeconds = CMTimeGetSeconds(player.currentTime())
        let durationSeconds = CMTimeGetSeconds(player.currentItem?.duration ?? CMTimeMake(value: 1, timescale: 1))
        let percentage = currentTimeSeconds / durationSeconds
        self.playView?.slider.value = Float(percentage)
    }

    func playTrack(previewUrl: String?) {
        guard let url = URL(string: previewUrl ?? "") else { return }
        let playerItem:AVPlayerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player.play()
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
//        player.seek(to: CMTime(seconds: Double(playView?.slider.value ?? 0),
//                               preferredTimescale: 1000))
//        playView?.timePassedLabel.text = "\(String(describing: playView?.slider.value))"
        let percentage = playView?.slider.value ?? 0
        guard let duration = player.currentItem?.duration else { return }
        let durationInSeconds = CMTimeGetSeconds(duration)
        let seekTimeUnSeconds = Float64(percentage) * durationInSeconds
        let seekTime = CMTimeMakeWithSeconds(seekTimeUnSeconds, preferredTimescale: 1)
        player.seek(to: seekTime)
    }

    @objc private func addFavoriteTrack() {
        bRec = !bRec
        if bRec {
            playView?.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            playView?.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            //tap
            manager.setData(data: playView?.trackLabel.text ?? "123")
        }
    }

    @objc func didDragDownTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func didTapBackButton() {
        let cellViewModel = delegate?.moveBack()
        guard let cellInfo = cellViewModel else { return }
        set(viewModel: cellInfo)
    }

    @objc private func didTapNextButton() {
        let cellViewModel = delegate?.moveNext()
        guard let cellInfo = cellViewModel else { return }
        set(viewModel: cellInfo)
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = PlayViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> PlayViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
