//
//  ViewController.swift
//  UpDownApp
//
//  Created by Byungju Chae on 2020/07/14.
//  Copyright © 2020 Byungju Chae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }
    
    @IBAction func sliderValueChanged(_ sender:UISlider) {
      print(sender.value)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        slider.value = 15
        print("Touch Up Reset Button")
    }
    
    @IBAction func touchUpHitButton(_ sender:UIButton) {
      print(slider.value)
    }

}

