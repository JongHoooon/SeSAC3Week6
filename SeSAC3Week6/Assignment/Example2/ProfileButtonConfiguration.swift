//
//  ProfileButtonConfiguration.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

extension UIButton.Configuration {
    
    enum ProfileButtonType {
        case chattingWithMe
        case editProfile
        case kakaoStory
        
        var title: String {
            switch self {
            case .chattingWithMe:   return "나와의 채팅"
            case .editProfile:      return "프로피 편집"
            case .kakaoStory:       return "카카오스토리"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .chattingWithMe:   return Example2Images.bubble
            case .editProfile:      return Example2Images.pencil
            case .kakaoStory:       return Example2Images.books
            }
        }
    }
    
    static func profileButtonStyle(type: ProfileButtonType) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.baseForegroundColor = .systemBackground
        configuration.baseBackgroundColor = .clear
        configuration.attributedTitle = AttributedString(
            type.title,
            attributes: AttributeContainer([
                .font: UIFont.systemFont(ofSize: 13.0)
            ])
        )
        configuration.image = type.image?
            .withTintColor(
                .systemBackground,
                renderingMode: .alwaysOriginal
            )
        configuration.imagePlacement = .top
        configuration.imagePadding = 16.0
    
        return configuration
    }
}
