//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class Example2ViewController: UIViewController {
    
    // MARK: - UI
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let dismissBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: Example2Images.xmark,
            style: .plain,
            target: nil,
            action: nil
        )
        
        return button
    }()
    
    private let presentBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: Example2Images.boxCircle,
            style: .plain,
            target: nil,
            action: nil
        )
        
        return button
    }()
    
    private let bankBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: Example2Images.dollarCircle,
            style: .plain,
            target: nil,
            action: nil
        )
        
        return button
    }()
    
    private let settingBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: Example2Images.gearCircle,
            style: .plain,
            target: nil,
            action: nil
        )
        
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.layer.borderColor = UIColor.systemGray6.cgColor
        imageView.layer.borderWidth = 0.5
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17.0, weight: .medium)
        label.text = "Brick"
        
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        
        return view
    }()
    
    private let chattingWithMeButton: UIButton = {
        let button = UIButton()
        button.configuration = .profileButtonStyle(type: .chattingWithMe)
        
        return button
    }()
    
    private let profileEditButton: UIButton = {
        let button = UIButton()
        button.configuration = .profileButtonStyle(type: .editProfile)
        
        return button
    }()
 
    private let kakaoStoryButton: UIButton = {
        let button = UIButton()
        button.configuration = .profileButtonStyle(type: .kakaoStory)
        
        return button
    }()
    
    private let profileButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12.0
        stackView.axis = .horizontal
        
        return stackView
    }()
    

    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupLayout()
        setupAction()
    }
}

// MARK: - Private

private extension Example2ViewController {
    
    func setupAction() {
        dismissBarButton.target = self
        dismissBarButton.action = #selector(dismissView)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .systemBackground
        
        navigationItem.leftBarButtonItem = dismissBarButton
        navigationItem.rightBarButtonItems = [
            settingBarButton,
            bankBarButton,
            presentBarButton,
        ]
    }
    
    func setupLayout() {
        
        [
            chattingWithMeButton,
            profileEditButton,
            kakaoStoryButton
        ].forEach { profileButtonStackView.addArrangedSubview($0) }
        
        [
            backgroundImageView,
            profileImageView,
            nameLabel,
            separator,
            profileButtonStackView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // background image view
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // profile button stack view
            profileButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButtonStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -36.0
            ),
            
            // separator
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separator.bottomAnchor.constraint(
                equalTo: profileButtonStackView.topAnchor,
                constant: -24.0
            ),
            separator.heightAnchor.constraint(
                equalToConstant: 1.0
            ),

            // name label
            nameLabel.bottomAnchor.constraint(
                equalTo: separator.topAnchor,
                constant: -36.0
            ),
            nameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            // profile image view
            profileImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            profileImageView.bottomAnchor.constraint(
                equalTo: nameLabel.topAnchor,
                constant: -8.0
            ),
            profileImageView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1.0/5.0
            ),
            profileImageView.heightAnchor.constraint(
                equalTo: profileImageView.widthAnchor
            )
        ])
        
        let profileImageViewWidth = view.frame.width / 5.0
        profileImageView.layer.cornerRadius = (profileImageViewWidth / 2.0) * (4.0 / 5.0)
    }
    
    @objc
    func dismissView()  {
        dismiss(animated: true)
    }
}
