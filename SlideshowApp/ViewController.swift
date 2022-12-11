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
        if (timer != nil){//この後に処理を入れている
            timer.invalidate()  //再生中に拡大画面にしようとするときに停止させる
            timer = nil  //nilの時だけ停止させる条件に加工する必要がある行
        }
        startButton.setTitle("再生", for: .normal)
        returnButton.isEnabled = true
        goButton.isEnabled = true
        
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
    //TapGestureRecognizerオブジェクトをUIImageViewの上に配置（埋め込む）←完了済み
    
    //あいさつアプリの名前を受け渡したコードを今度は、画像を受け渡す処理に変える。
    //拡大は必要なく、画像をイメージビューに写す。
    //文字列の受け渡しではなく、画像を受け取るためのプロパティを用意する
    //上記の３行分まではコード完了済み
    
    //スライドショー画面から遷移するときに拡大画面上のプロパティに設定する(あいさつアプリと同じ流れ)→これもResultViewがめんにコード完了済み
    
    //拡大画面から戻るときは、レッスン４の課題と同じ。
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    //スライド画面の画像をタップしたときに遷移する・・・この後、ResultViewController 画面の「戻る」ぼたんをコントっロールぼたん＋ドラッグして、上部のエグジットにドラッグして指定する。（テキストLesson 4Chapter 8.1　segueの真ん中あたりに記載あり）
    
    //再生中にタップ拡大した際には、スライドショーを一旦停止させるコードが必要→再生中に拡大画面にしようとするときに停止させる
    
    
    
}


