//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/21.
//

import UIKit

// 1. 객체 얹이고, 레이아웃 잡고, 아울렛 연결, 속성 조절

// 1. 뷰 객체 프로퍼티 선언(클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 (+ translatesAutoresizingMaskIntoConstraints false 처리)
// 3. 크기와 위치를 정의
// 4. 속성 정의
// Frame의 한계
// AutoResizingMask, AutoLayout => 스토리보드 대응
// NSLayoutConstraints => 코드베이스 대응
//   1. isActive
//   2. add constraints
//   3. NSLayoutAnchor
// NSLayoutAnchor
// snapKit

class ViewController: UIViewController {

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        // 1. 프레임 기반 layout
        let emailTextFieldWidth = UIScreen.main.bounds.width - 50.0 * 2
        emailTextField.frame = CGRect(
            x: 50.0,
            y: 80.0,
            width: emailTextFieldWidth,
            height: 50.0
        )

        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요."
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .brown
        
        // MARK: - Is Active
        
//        NSLayoutConstraint(
//            item: passwordTextField,
//            attribute: .leading,
//            relatedBy: .equal,
//            toItem: view.safeAreaLayoutGuide,
//            attribute: .leading,
//            multiplier: 1.0,
//            constant: 50.0
//        )
//        .isActive = true    // 레이아웃 활성화
//
//        NSLayoutConstraint(
//            item: passwordTextField,
//            attribute: .trailing,
//            relatedBy: .equal,
//            toItem: view.safeAreaLayoutGuide,
//            attribute: .trailing,
//            multiplier: 1.0,
//            constant: -50.0
//        )
//        .isActive = true
//
//        NSLayoutConstraint(
//            item: passwordTextField,
//            attribute: .height,
//            relatedBy: .equal,
//            toItem: nil,
//            attribute: .height,
//            multiplier: 1.0,
//            constant: 60.0
//        )
//        .isActive = true
//
//        NSLayoutConstraint(
//            item: passwordTextField,
//            attribute: .top,
//            relatedBy: .equal,
//            toItem: emailTextField,
//            attribute: .bottom,
//            multiplier: 1.0,
//            constant: 50.0
//        )
//        .isActive = true
        
        // MARK: - Add Constraint
        
        let leading = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view.safeAreaLayoutGuide,
            attribute: .leading,
            multiplier: 1.0,
            constant: 50.0
        )
        
        let trailing = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view.safeAreaLayoutGuide,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -50.0
        )
        
        let height = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1.0,
            constant: 60.0
        )
        
        let top = NSLayoutConstraint(
            item: passwordTextField,
            attribute: .top,
            relatedBy: .equal,
            toItem: emailTextField,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 50.0
        )
        
        view.addConstraints([
            leading,
            trailing,
            height,
            top
        ])
        
        setNSLayoutAnchor()
    }
    
    @objc
    func signButtonClicked() {
        
//        let vc = TextViewController()
        
        let vc = LocationViewController()
        
        present(vc, animated: true)
    }
    
    func setNSLayoutAnchor() {
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.backgroundColor = .blue
        
        signButton.addTarget(
            self,
            action: #selector(signButtonClicked),
            for: .touchUpInside
        )
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300.0),
            signButton.heightAnchor.constraint(equalToConstant: 50.0),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
