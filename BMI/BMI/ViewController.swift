//
//  ViewController.swift
//  BMI
//
//  Created by Ari Han on 4/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        
        calculateBtn.clipsToBounds = true
        calculateBtn.layer.cornerRadius = 5
        calculateBtn.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해 주세요."
        weightTextField.placeholder = "kg단위로 입력해 주세요."
    }
    
    

    @IBAction func calculateButton(_ sender: UIButton) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다."
            mainLabel.textColor = UIColor.red
            return false
        }
        
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        mainLabel.textColor = UIColor.black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
           let secondVC = segue.destination as! SecondViewController
            
        }
        
        // 다음 화면으로 가기 전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true // 글자 입력 허용
        }
        return false // 글자 입력 허용하지 않음
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 화면 터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

