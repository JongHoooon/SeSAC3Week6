//
//  MiddleMenuButtonConfiguration.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit



extension UIButton.Configuration {

    enum middleButtonType {
        case like
        case info
        
        var title: String {
            switch self {
            case .like:      return "내가 찜한 컨텐츠"
            case .info:      return "정보"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .like:     return NetflixImageSpace.Icon.check
            case .info:     return NetflixImageSpace.Icon.info
            }
        }
    }
    
    static func middleMenu(type: middleButtonType) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .clear
        configuration.baseForegroundColor = .white
        configuration.imagePlacement = .top
        configuration.imagePadding = 8.0
        configuration.title = type.title
        configuration.attributedTitle = AttributedString(
            type.title,
            attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 12.0, weight: .light)
            ])
        )
        configuration.image = type.image
        return configuration
    }
}
