//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Ari Han on 4/2/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text =  "초를 선택하세요."
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        
        
        //아래와 같이 사용할 수도 있음(클로저 방식)
        
        //        //1초씩 지나갈 때마다 설정
        //        timer?.invalidate()
        //        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
        //
        //            //반복 하고 싶은 코드
        //            if number > 0 {
        //
        //                number -= 1
        //                //슬라이드 줄이고 레이블 바꾸기
        //                slider.value = Float(number / 60)
        //                mainLabel.text = "\(number)초"
        //
        //            } else {
        //                number = 0
        //                mainLabel.text = "초를 선택하세요."
        //                timer?.invalidate()
        //
        //                //소리 나게하기
        //                AudioServicesPlayAlertSound(SystemSoundID(1322))
        //            }
        //
        //        })
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            
            number -= 1
            //슬라이드 줄이고 레이블 바꾸기
            slider.value = Float(number / 60)
            mainLabel.text = "\(number)초"
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요."
            timer?.invalidate()
            
            //소리 나게하기
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        //초기화 셋팅
        mainLabel.text = "초를 선택하세요."
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
        
    }
    
}

