//
//  ViewController.swift
//  Shake It
//
//  Created by BEATRIZ MACEDO on 10/1/15.
//  Copyright © 2015 Beatriz Macedo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["pop", "crash", "jump", "beep", "screech", "bomb", "scream", "boing", "fall"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do{
                
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {
                // Exception Handling
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

