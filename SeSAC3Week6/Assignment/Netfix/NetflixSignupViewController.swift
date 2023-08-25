//
//  NetflixSignupViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class NetflixSignupViewController: UIViewController {
    
    // MARK: - UI
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16.0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    private let idTextField = SignupTextField(placeholder: "이메일 주소 또는 전화번호")
    private let passwordTextField = SignupTextField(placeholder: "비밀번호")
    private let nicknameTextField = SignupTextField(placeholder: "닉네임")
    private let locationTextField = SignupTextField(placeholder: "위치")
    private let recommendtaionTextField = SignupTextField(placeholder: "추천 코드 입력")
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .bold)
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private let moreInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        return label
    }()
    
    private let moreInfoSwitch: UISwitch = {
        let moreInfoSwitch = UISwitch()
        moreInfoSwitch.onTintColor = .systemOrange
        return moreInfoSwitch
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureLayout()
        addAction()
    }
}

// MARK: - Private
private extension NetflixSignupViewController {
    
    func addAction() {
        signupButton.addTarget(
            self,
            action: #selector(signupButtonTapped),
            for: .touchUpInside
        )
    }
    
    func configureNavigationBar() {
        navigationItem.title = "BRICKFLICK"
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 28.0, weight: .black),
            .foregroundColor: UIColor.systemOrange
        ]
    }
    
    func configureLayout() {
        
        [
            idTextField,
            passwordTextField,
            nicknameTextField,
            locationTextField,
            recommendtaionTextField,
            signupButton
        ].forEach {
            textFieldStackView.addArrangedSubview($0)
        }
        
        [
            textFieldStackView,
            moreInfoLabel,
            moreInfoSwitch
        ].forEach { view.addSubview($0) }
        
        textFieldStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(32.0)
        }
        signupButton.snp.makeConstraints {
            $0.height.equalTo(44.0)
        }
        
        moreInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(textFieldStackView)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(20.0)
        }
        moreInfoSwitch.snp.makeConstraints {
            $0.trailing.equalTo(textFieldStackView)
            $0.centerY.equalTo(moreInfoLabel)
        }
    }
    
    @objc
    func signupButtonTapped() {
        
    }
}
