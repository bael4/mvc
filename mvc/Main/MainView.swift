//
//  ViewController.swift
//  mvc
//
//  Created by Баэль Рыспеков on 12/4/23.
//

import UIKit

class MainView: UIViewController {
    
    private var controller: MainController!
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    private lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("-", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)

        button.addTarget(self, action: #selector(plusMethod), for: .touchUpInside)
        button.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.shadowOpacity = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()
    
    
    private lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("+", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)

        button.addTarget(self, action: #selector(minusMethod), for: .touchUpInside)
        button.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.shadowOpacity = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()

    
 
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        controller = MainController(view: self)
    
    }
    
    
    @objc func minusMethod() {
        updateLabel(text: controller.plusNumberC())
    }
    
    @objc func plusMethod() {
        updateLabel(text: controller.minusNumberC())
    }
    
    func updateLabel (text: Int)  {
        label.text = String(text)
    }
    
    private func setupSubViews(){
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    
        
        view.addSubview(buttonMinus)
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonMinus.centerXAnchor.constraint(equalTo: label.centerXAnchor, constant: -100),
            buttonMinus.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 100),
            buttonMinus.heightAnchor.constraint(equalToConstant: 50),
            buttonMinus.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(buttonPlus)
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlus.centerXAnchor.constraint(equalTo: label.centerXAnchor, constant: 100),
            buttonPlus.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 100),
            buttonPlus.heightAnchor.constraint(equalToConstant: 50),
            buttonPlus.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    

    


}

