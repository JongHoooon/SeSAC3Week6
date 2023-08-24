//
//  UIViewController+Extension.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case present            // 네비게이션 없이 present
        case presentNavigation  // 네비게이션 임데드 된 present
        case presentFull        // 네비게이션 임데드 된 fullscreen present
        case push
    }
    
    /*
     "고래밥" > String
     String > String.self > String.Type
     
     */
    func transition<T: UIViewController>(
        viewController: T.Type,
        storyboard: String,
        style: TransitionStyle
    ) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFull:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // Type Parameter
    // Type Constraints: 클래스 제약 / 프로토콜 제약
    // UpperCased
    func configureBorder<T: UIView>(view: T) {
        view.layer.cornerRadius = 8.0
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
    }
    
    // 덧셈이 가능한 타입들만 들어와 줘야한다. (AdditiveArithmetic)
    // Generic: 타입에 유용하게 대응하기 위한 요소
    // 코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
}
