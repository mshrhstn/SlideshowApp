//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 菱谷昌弘 on 2020/07/25.
//  Copyright © 2020 masahiro.hishitani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton! //進む
    @IBOutlet weak var backButton: UIButton! //戻る
    @IBOutlet weak var switchButton: UIButton! //再生/停止
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "IMG_6570")
        imageView.image = image
        
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.myviewTapped(_:)))
        
        //tapGesture.numberOfTapsRequired = 1
        //tapGesture.numberOfTouchesRequired = 1
        //self.imageView.isUserInteractionEnabled = true
        //self.imageView.addGestureRecognizer(tapGesture)
        // 一定の間隔で処理を行うためのタイマー
        
        
        // タイマーを設定(1.5秒ごと)
        //self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        
    }
    
    var displayImageNo = 0
    
    let imageNameArray = ["IMG_6570", "IMG_6725", "IMG_6729"]
    
    func displayImage() {
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        imageView.image = image
        }
    
    //進むボタン
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            //表示画像の番号を１増やす
            displayImageNo += 1
            
            //表示している画像番号を元に画像を表示
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
            }
        
    }
    
    //戻るボタン
    @IBAction func backButtonTap(_ sender: Any) {
                if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
                    
                // 表示している画像の番号を1減らす
                displayImageNo -= 1
                // 表示している画像の番号を元に画像を表示する
                displayImage()
            } else {
                displayImageNo = imageNameArray.count - 1
                displayImage()
        }
    }
    
    

    
    //再生・停止ボタン
    @IBAction func switchButtonTap(_ sender: Any) {
        
    //動作中のタイマーを１つに保つため、timer が存在しない場合だけタイマーを生成し動作する
        if self.timer == nil {
        //タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
        //再生・停止動作時は進むボタン・戻るボタンを非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
        //ボタンの名前を「停止」にする
            switchButton.setTitle("停止", for: .normal)
        // 背景色・ボタン内テキストサイズを変更
        self.view.backgroundColor = UIColor.lightGray
        switchButton.titleLabel?.font =
        UIFont.systemFont(ofSize: 25)
        
    } else if self.timer != nil {
        // タイマーを停止
        self.timer.invalidate()
        // nil にして再び再生(nil の時にタイマー生成)
        self.timer = nil
        // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
        nextButton.isEnabled = true
        backButton.isEnabled = true
        // ボタンの名前を再生とする
        switchButton.setTitle("再生", for: .normal)
        // 背景色・ボタン内テキストサイズを戻す
        self.view.backgroundColor = UIColor.white
        switchButton.titleLabel?.font =
        UIFont.systemFont(ofSize: 20)
    }
            
}
        // #selectorで呼び出される関数
        @objc func updateTimer(_ timer: Timer) {
            // 進むボタンの内容を行う
            if displayImageNo < imageNameArray.count - 1 {
                // 表示している画像の番号を1増やす
                displayImageNo += 1
                // 表示している画像の番号を元に画像を表示する
                displayImage()
                print(displayImageNo) // 取得インデックスの確認
            } else {
                displayImageNo = 0
                displayImage()
                print(displayImageNo) // 取得インデックスの確認
            }
        }
    
        
    @IBAction func onTapAction(_ sender: Any) {
        //タップした時のスライドショーのタイマーを止める
        if self.timer != nil {
        print("タイマー停止")
        switchButton.setTitle("再生", for: .normal)
        backButton.isEnabled = true
        nextButton.isEnabled = true
        // タイマーを停止
        timer.invalidate()
        // nil にして再び再生(nil の時にタイマー生成)
        self.timer = nil
        //戻った時に背景色を白にする
        self.view.backgroundColor = UIColor.white
        }
        //遷移先(toNextView)に移動する
        self.performSegue(withIdentifier: "toNextView", sender: nil)
    }
    //@objc func myviewTapped(_ sender: UITapGestureRecognizer) {
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のNextViewControllerのインスタンスを取得する
        let nextViewController:NextViewController = segue.destination as! NextViewController
            // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
            // 画像を読み込み
        let image = UIImage(named: name)
            
            // 遷移先のNextViewControllerで宣言しているselectedImgに値を代入して渡す
        nextViewController.selectedImg = image
        }
    //let newViewController = NextViewController()
    //self.show(newViewController, sender: nil)
}



