//
//  ViewController.swift
//  UpDownApp
//
//  Created by Byungju Chae on 2020/07/14.
//  Copyright © 2020 Byungju Chae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    @IBOutlet weak var minValLabel: UILabel!
    @IBOutlet weak var maxValLabel: UILabel!

    // 화면의 값들을 업데이트한다
    func updateValues() {
        tryCountLabel.text = "\(tryCount) / 5"
        minValLabel.text = "\(Int(slider.minimumValue))"
        maxValLabel.text = "\(Int(slider.maximumValue))"
        sliderValueLabel.text = "\(Int(slider.value))"
    }
    
    // 전체 세팅을 초기화한다
    func reset() {
        print("Reset!")
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        updateValues()
    }

    // 화면이 로딩되면 초기화한다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset() 
    }
    
    // slider의 값이 바뀌면 위의 표시되는 숫자를 바꾼다
    @IBAction func sliderValueChanged(_ sender:UISlider) {
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    // Reset 버튼을 누르면 전체를 초기화한다
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("Touch Up Reset Button")
        reset()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK",
                                  style: .default) { (action) in
                                    self.reset()
        }
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
    }
    
    // Hit 버튼을 누른다
    @IBAction func touchUpHitButton(_ sender:UIButton) {
        let val = Int(slider.value)
        
        if randomValue == val {
            showAlert(message: "Correct! Answer was \(randomValue)")
        }
        else if tryCount >= 5 {
            showAlert(message: "You Lose!")
            reset()
        }
        else {
            slider.value = Float(val)
            if randomValue > val { slider.minimumValue = Float(val) }
            else { slider.maximumValue = Float(val) }
        }
        
        tryCount += 1
        updateValues()
        
    }

}

