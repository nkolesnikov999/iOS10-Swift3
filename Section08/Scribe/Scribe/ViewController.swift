//
//  ViewController.swift
//  Scribe
//
//  Created by NK on 20.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var transcriptionTextField: UITextView!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                        sound.delegate = self
                    } catch {
                        let error = error as NSError
                        print(error.debugDescription)
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("Error: \(error.localizedDescription)")
                        } else {
                            if let result = result {
                                self.transcriptionTextField.text = result.bestTranscription.formattedString
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func playBtnPressed(_ sender: CircleButton) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Player - \(player.isPlaying)")
        self.activitySpinner.stopAnimating()
        self.activitySpinner.isHidden = true
    }

}

