//
//  InitialViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/27/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit
import AVFoundation

class InitialViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playVideo()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
            self.fadeAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fadeAnimation()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        avPlayer.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        avPlayer.pause()
        paused = true
    }
    func setupUI() {
        // Borders, rounded edges, adjusting text
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.cornerRadius = 5
        getStartedButton.titleLabel?.adjustsFontSizeToFitWidth = true
        getStartedButton.layer.borderWidth = 1
        getStartedButton.layer.borderColor = UIColor.red.cgColor
    }
    
    func fadeAnimation() {
        // Fade Animation
        getStartedButton.fadeOut()
        getStartedButton.fadeIn()
    }
    
    func playVideo() {
        let theURL = Bundle.main.url(forResource:"CarDriving", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero) { (finished) in
            
        }
    }
}
