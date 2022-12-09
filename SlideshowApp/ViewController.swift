//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiro Katoh on 2022/10/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    
    var imageNo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1 = UIImage(named:"image1")
        image2 = UIImage(named:"image2")
        image3 = UIImage(named:"image3")
        startButton.setTitle("再生", for: .normal)
    }
    
    @IBAction func go(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 1
        } else if imageNo == 1 {
            imageNo = 2
        } else if imageNo == 2 {
            imageNo = 0
        }
        // imageNoに該当する画像を取得
        var nextImage: UIImage!
        if imageNo == 0 {
            nextImage = UIImage(named: "image1")
        } else if imageNo == 1 {
            nextImage = UIImage(named: "image2")
        } else if imageNo == 2 {
            nextImage = UIImage(named: "image3")
        }
        
        // 特定した画像をイメージビューに設定する
        imageView.image = nextImage
        //停止ボタンをタップすると自動送りが止まり、進むボタンと戻るボタンをタップ可能にしてください
    }
    @IBAction func `return`(_ sender: Any) {
        if imageNo == 2 {
            imageNo = 1
        } else if imageNo == 1 {
            imageNo = 0
        } else if imageNo == 0 {
            imageNo = 2
        }
        // imageNoに該当する画像を取得
        var nextImage: UIImage!
        if imageNo == 0 {
            nextImage = UIImage(named: "image1")
        } else if imageNo == 1 {
            nextImage = UIImage(named: "image2")
        } else if imageNo == 2 {
            nextImage = UIImage(named: "image3")
        }
        // 特定した画像をイメージビューに設定する
        imageView.image = nextImage
    }
    
    var timer: Timer!
    
    var timer_second: Float = 0
    
    @IBAction func startTimer(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(updateTimer(_:)),userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if imageNo == 0 {
            imageNo = 1
        } else if imageNo == 1 {
            imageNo = 2
        } else if imageNo == 2 {
            imageNo = 0
        }
        // imageNoに該当する画像を取得
        var nextImage: UIImage!
        if imageNo == 0 {
            nextImage = UIImage(named: "image1")
        } else if imageNo == 1 {
            nextImage = UIImage(named: "image2")
        } else if imageNo == 2 {
            nextImage = UIImage(named: "image3")
        }
        
        // 特定した画像をイメージビューに設定する
        imageView.image = nextImage
        
    }
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func auto(_ sender: Any) {
        if (timer == nil) {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)),userInfo: nil, repeats: true)
            startButton.setTitle("停止", for: .normal)
            returnButton.isEnabled = false
            goButton.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            startButton.setTitle("再生", for: .normal)
            returnButton.isEnabled = true
            goButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
           let resultViewController:ResultViewController = segue.destination as! ResultViewController

        var nextImage: UIImage!
        if imageNo == 0 {
            nextImage = UIImage(named: "image1")
        } else if imageNo == 1 {
            nextImage = UIImage(named: "image2")
        } else if imageNo == 2 {
            nextImage = UIImage(named: "image3")
        }
        
        // 特定した画像をイメージビューに設定する
        resultViewController.image = nextImage
        
        
    }
}

