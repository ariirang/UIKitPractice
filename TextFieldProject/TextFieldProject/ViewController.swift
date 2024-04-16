//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Ari Han on 4/3/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always //한 번에 지울 수 있는 기능
        textField.returnKeyType = .done //텍스트 작성 후 키보드 우편에 다음 단계 진행을 나타내는 버튼
        textField.becomeFirstResponder() //앱의 화면에 들어오자마자 첫 번째로 반응하게 하는 것
    }
    
    // 텍스트필드의 입력을 시작할 때 호출되는 것
    func textFieldShoudBeingEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드의 입력을 시작함")
    }
    
    // clearButton을 눌렀을 때 작성한 텍스트를 다 지울 수 있게 함
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드 글자가 입력 되거나 지워질 때 출력되게 하는 것
    // 글자수 최대 10글자 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    //화면 터치시 키보드 내려가게 하기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    // 텍스트필드의 엔터키를 누르면 다음 동작을 허락하는 것
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // 실제 텍스트필드에 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게 하는 것
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
    }
    
}

