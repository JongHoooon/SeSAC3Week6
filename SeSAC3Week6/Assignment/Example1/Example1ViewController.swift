//
//  Example1.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class Example1ViewController: UIViewController {
    private let exampleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        
        return imageView
    }()
    
    private let titleTextField: Example1TextFeild = {
        let textField = Example1TextFeild(placeHolder: "제목을 입력해주세요")
        
        return textField
    }()
    
    private let dateTextField: Example1TextFeild = {
        let textField = Example1TextFeild(placeHolder: "날짜를 입력해주세요")
        
        return textField
    }()
    
    private let exampleTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.label.cgColor
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureLayout()
    }
}

private extension Example1ViewController {
    
    func configureLayout() {
        
        [
            exampleImageView,
            titleTextField,
            dateTextField,
            exampleTextView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let horizontalInset = 24.0
        let verticalInset = 12.0
        let noInsetsHeight = view.frame.height
            - verticalInset * 3
            - view.safeAreaInsets.bottom
            - view.safeAreaInsets.top
        let exampleImageViewHeight = noInsetsHeight * (4.0 / 14.0)
        let textFieldHeight = noInsetsHeight * (1.0 / 14.0)
        let textViewHeight = noInsetsHeight * (8.0 / 14.0)
        
        NSLayoutConstraint.activate([
            // image view
            exampleImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            exampleImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: horizontalInset
            ),
            exampleImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -horizontalInset
            ),
            exampleImageView.heightAnchor.constraint(
                equalToConstant: exampleImageViewHeight
            ),
            
            // title text field
            titleTextField.topAnchor.constraint(
                equalTo: exampleImageView.bottomAnchor,
                constant: verticalInset
            ),
            titleTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: horizontalInset
            ),
            titleTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -horizontalInset
            ),
            titleTextField.heightAnchor.constraint(
                equalToConstant: textFieldHeight
            ),
            
            // date text field
            dateTextField.topAnchor.constraint(
                equalTo: titleTextField.bottomAnchor,
                constant: verticalInset
            ),
            dateTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: horizontalInset
            ),
            dateTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -horizontalInset
            ),
            dateTextField.heightAnchor.constraint(
                equalToConstant: textFieldHeight
            ),
            
            // example text view
            exampleTextView.topAnchor.constraint(
                equalTo: dateTextField.bottomAnchor,
                constant: verticalInset
            ),
            exampleTextView.leadingAnchor.constraint(
                equalTo: dateTextField.leadingAnchor
            ),
            exampleTextView.trailingAnchor.constraint(
                equalTo: dateTextField.trailingAnchor
            ),
            exampleTextView.heightAnchor.constraint(
                equalToConstant: textViewHeight
            )
        ])
    }
}
