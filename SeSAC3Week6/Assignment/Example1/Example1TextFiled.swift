//
//  Example1TextFiled.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class Example1TextFeild: UITextField {
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeHolder
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.label.cgColor
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
