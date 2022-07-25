//
//  ViewController.swift
//  Kenynew
//
//  Created by Ömer Faruk on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    var kenyArray = [UIImageView]()
    var hideTimer =  Timer()
    var highScore = 0
    var bhideTimer = Timer()
    var btimer = Timer()
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var keny1: UIImageView!
    @IBOutlet weak var keny2: UIImageView!
    @IBOutlet weak var keny3: UIImageView!
    @IBOutlet weak var keny4: UIImageView!
    @IBOutlet weak var keny5: UIImageView!
    @IBOutlet weak var keny6: UIImageView!
    @IBOutlet weak var keny7: UIImageView!
    @IBOutlet weak var keny8: UIImageView!
    @IBOutlet weak var keny9: UIImageView!
    
    
    @IBAction func tryAgainButton(_ Sender: UIButton) {
        if counter != 0 {
            hideTimer.invalidate()
            timer.invalidate()
            btimer.invalidate()
            bhideTimer.invalidate()
           
            score = 0
            scoreLabel.text = "Score: \(score)"
            
            counter = 10
            timeLabel.text = String(counter)
            btimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            bhideTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(bhideKeny), userInfo: nil, repeats: true)
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore1")
            }
        }
        
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            btimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            bhideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(bhideKeny), userInfo: nil, repeats: true)

            
            
            score = 0
            scoreLabel.text = "Score: \(score)"
            counter = 10
            timeLabel.text = String(counter)
            for keny in kenyArray {
                keny.isHidden = true
            }
            let random = arc4random_uniform(UInt32(kenyArray.count - 1))
            kenyArray[Int(random)].isHidden = false
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore1")
            }
    }


    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        //highScore
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore1")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
        scoreLabel.text = "Score: \(score)"
        //images
        keny1.isUserInteractionEnabled = true
        keny2.isUserInteractionEnabled = true
        keny3.isUserInteractionEnabled = true
        keny4.isUserInteractionEnabled = true
        keny5.isUserInteractionEnabled = true
        keny6.isUserInteractionEnabled = true
        keny7.isUserInteractionEnabled = true
        keny8.isUserInteractionEnabled = true
        keny9.isUserInteractionEnabled = true
        
        
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        keny1.addGestureRecognizer(recognizer1)
        keny2.addGestureRecognizer(recognizer2)
        keny3.addGestureRecognizer(recognizer3)
        keny4.addGestureRecognizer(recognizer4)
        keny5.addGestureRecognizer(recognizer5)
        keny6.addGestureRecognizer(recognizer6)
        keny7.addGestureRecognizer(recognizer7)
        keny8.addGestureRecognizer(recognizer8)
        keny9.addGestureRecognizer(recognizer9)
        
        
        kenyArray = [keny1,keny2,keny3,keny4,keny5,keny6,keny7,keny8,keny9,keny1,keny2,keny3,keny4,keny5,keny6,keny7,keny8,keny9]
        
        
        
        
        //timers
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKeny), userInfo: nil, repeats: true)
        hideKeny()
        
    }
    
    @objc func bhideKeny(){
        for keny in kenyArray {
            keny.isHidden = true
        }
        let random = arc4random_uniform(UInt32(kenyArray.count - 1))
        kenyArray[Int(random)].isHidden = false
        if score == 10 {
            score += 1
            scoreLabel.text = "Score: \(score)"
            counter += 4
            timeLabel.text = String(counter)
        }
        if score == 20 {
            counter += 5
            timeLabel.text = String(counter)
            score += 1
            scoreLabel.text = "Score: \(score)"
        }
        if score == 30 {
            counter += 5
            timeLabel.text = String(counter)
            score += 1
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    @objc func hideKeny(){
        for keny in kenyArray {
            keny.isHidden = true
        }
        let random = arc4random_uniform(UInt32(kenyArray.count - 1))
        kenyArray[Int(random)].isHidden = false
        if score == 10 {
            counter += 4
            timeLabel.text = String(counter)
        }
        if score == 20 {
            counter += 5
            timeLabel.text = String(counter)
        }
        if score == 30 {
            counter += 5
            timeLabel.text = String(counter)
        }
    }
    
    
    
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    @objc func countdown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            btimer.invalidate()
            bhideTimer.invalidate()
            for keny in kenyArray {
                keny.isHidden = true
                if self.score > self.highScore {
                    self.highScore = self.score
                    highScoreLabel.text = "Highscore: \(self.highScore)"
                    UserDefaults.standard.set(self.highScore, forKey: "highScore1")
                }
            }
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self]  UIAlertAction in
                //replay function
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 11
                self.timeLabel.text = String(self.score)
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKeny), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
    }
        
   
    
    
    
    
    }
    
}

