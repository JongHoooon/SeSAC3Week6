//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

import SnapKit

final class TextViewController: UIViewController {
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15.0)
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)
        
        [
            photoImageView,
            titleTextField
        ].forEach { view.addSubview($0) }
        
        photoImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view).multipliedBy(0.3)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(20.0)
            $0.leadingMargin.equalTo(20.0)
            $0.trailingMargin.equalTo(-20.0)
            $0.height.equalTo(50.0)
        }
    }
}
