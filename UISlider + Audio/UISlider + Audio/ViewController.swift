//
//  ViewController.swift
//  UISlider + Audio
//
//  Created by Владелец on 18.03.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.frame = CGRect(x: 100, y: 100, width: 200, height: 23)
        view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        
        
        myButton.layer.cornerRadius = 15
        //Risk's avoider
        do {
            if let audioPath = Bundle.main.path(forResource: "Thang", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Errorrrr")
        }
        
        player.play()
        
    }
    //Moment slider
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    //Play button
    @IBAction func playButton(_ sender: Any) {
        if player.isPlaying {
            self.player.pause()
        } else {
            self.player.play()
        }
    }
    //Volume changer
    @IBAction func sliderVolina(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    

}

