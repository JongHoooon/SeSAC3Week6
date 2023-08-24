//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/24.
//

import UIKit

final class CustomViewController: UIViewController {
    
    let idTextField: UITextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "아이디를 입력해주세요"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = BlackRadiusTextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300.0)
            $0.height.equalTo(50.0)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.center.equalToSuperview().offset(100.0)
            $0.width.equalTo(300.0)
            $0.height.equalTo(50.0)
        }        
    }
}
