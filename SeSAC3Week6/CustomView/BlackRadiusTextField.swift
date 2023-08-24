//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    // Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { // UIView
        super.init(frame: frame)
        
        setupView()
    }
    
    // NSCoding
    // XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    // Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    // 실패가능한 이니셜라이저여서 코드 베이스시 실패하게 된다.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        borderStyle = .none
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        placeholder = "제목을 입력해주세요"
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15.0)
    }
}

protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    
    // required - protocol에서 생성된 경우 사용하는 키워드
    // required Initializer
    required init(name: String) {
        
    }
    
    


}
