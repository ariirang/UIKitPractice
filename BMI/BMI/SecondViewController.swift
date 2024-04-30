//
//  SecondViewController.swift
//  BMI
//
//  Created by Ari Han on 4/30/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        bmiLabel.clipsToBounds = true
        bmiLabel.layer.cornerRadius = 8
        bmiLabel.backgroundColor = .gray
        
        backBtn.clipsToBounds = true
        backBtn.layer.cornerRadius = 5
        
        guard let bmi = bmi else {return}
        bmiLabel.text = String(bmi)
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
