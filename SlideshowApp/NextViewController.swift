//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 菱谷昌弘 on 2020/07/25.
//  Copyright © 2020 masahiro.hishitani. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image Viewに画像を設定
        imageView.image = selectedImg
        // Do any additional setup after loading the view.
    }
    
    // 戻る
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
