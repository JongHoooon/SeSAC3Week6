//
//  SignupTextField.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class SignupTextField: UITextField {
    
    // MARK: - Init
    /// Default Height: 36.0 입니다.
    init(placeholder: String) {
        super.init(frame: .init(x: 0, y: 0, width: 0, height: 36.0))
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.white]
        )
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SignupTextField {
    
    func configureView() {
        backgroundColor = .darkGray
        tintColor = .white
        layer.cornerRadius = 4.0
        textAlignment = .center
        font = .systemFont(ofSize: 14.0, weight: .light)
    }
}
