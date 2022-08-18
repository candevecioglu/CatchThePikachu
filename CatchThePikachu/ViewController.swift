//
//  ViewController.swift
//  CatchThePikachu
//
//  Created by M. Can Devecioğlu on 4.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var score           = Int()
    var timer           = Timer()
    var counter         = Int()
    var pikachuArray    = [UIImageView]()
    var hideTimer       = Timer()
    var highScore       = Int()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    @IBOutlet weak var p6: UIImageView!
    @IBOutlet weak var p7: UIImageView!
    @IBOutlet weak var p8: UIImageView!
    @IBOutlet weak var p9: UIImageView!
    @IBOutlet weak var p10: UIImageView!
    @IBOutlet weak var p11: UIImageView!
    @IBOutlet weak var p12: UIImageView!
    @IBOutlet weak var p13: UIImageView!
    @IBOutlet weak var p14: UIImageView!
    @IBOutlet weak var p15: UIImageView!
    @IBOutlet weak var p16: UIImageView!
    @IBOutlet weak var p17: UIImageView!
    @IBOutlet weak var p18: UIImageView!
    @IBOutlet weak var p19: UIImageView!
    @IBOutlet weak var p20: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        //Highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "HS")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        p1.isUserInteractionEnabled = true
        p2.isUserInteractionEnabled = true
        p3.isUserInteractionEnabled = true
        p4.isUserInteractionEnabled = true
        p5.isUserInteractionEnabled = true
        p6.isUserInteractionEnabled = true
        p7.isUserInteractionEnabled = true
        p8.isUserInteractionEnabled = true
        p9.isUserInteractionEnabled = true
        p10.isUserInteractionEnabled = true
        p11.isUserInteractionEnabled = true
        p12.isUserInteractionEnabled = true
        p13.isUserInteractionEnabled = true
        p14.isUserInteractionEnabled = true
        p15.isUserInteractionEnabled = true
        p16.isUserInteractionEnabled = true
        p17.isUserInteractionEnabled = true
        p18.isUserInteractionEnabled = true
        p19.isUserInteractionEnabled = true
        p20.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer16 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer17 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer18 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer19 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer20 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        p1.addGestureRecognizer(recognizer1)
        p2.addGestureRecognizer(recognizer2)
        p3.addGestureRecognizer(recognizer3)
        p4.addGestureRecognizer(recognizer4)
        p5.addGestureRecognizer(recognizer5)
        p6.addGestureRecognizer(recognizer6)
        p7.addGestureRecognizer(recognizer7)
        p8.addGestureRecognizer(recognizer8)
        p9.addGestureRecognizer(recognizer9)
        p10.addGestureRecognizer(recognizer10)
        p11.addGestureRecognizer(recognizer11)
        p12.addGestureRecognizer(recognizer12)
        p13.addGestureRecognizer(recognizer13)
        p14.addGestureRecognizer(recognizer14)
        p15.addGestureRecognizer(recognizer15)
        p16.addGestureRecognizer(recognizer16)
        p17.addGestureRecognizer(recognizer17)
        p18.addGestureRecognizer(recognizer18)
        p19.addGestureRecognizer(recognizer19)
        p20.addGestureRecognizer(recognizer20)
        
        pikachuArray = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]
        
        //Timers
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePikachu), userInfo: nil, repeats: true)
        
        hidePikachu()
    }
    
    
    @objc func hidePikachu () {
        for pikachu in pikachuArray {
            pikachu.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(pikachuArray.count - 1)))
        pikachuArray[random].isHidden = false
        
    }

    @objc func increaseScore () {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown () {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            for pikachu in pikachuArray {
                pikachu.isHidden = true
            }
            
            //HighScore
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "HS")
            }
            
            //Alert
            let alert = UIAlertController(title: "Time's Up!", message: "Do you want play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replay = UIAlertAction(title: "Play Again!", style: UIAlertAction.Style.default) { UIAlertAction in
               
                // Replay function in clousure
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidePikachu), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replay)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    

}

