//
//  FirstViewController.swift
//  NextVC
//
//  Created by Ari Han on 4/24/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainlLabel = UILabel()
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(FirstViewController.self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        makeAutoLayout()
    }
    
    func setUp() {
        mainlLabel.text = someString
        mainlLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainlLabel)
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
        
    }
    
    func makeAutoLayout() {
        mainlLabel.translatesAutoresizingMaskIntoConstraints = false
        mainlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainlLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
