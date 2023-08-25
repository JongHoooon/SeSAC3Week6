//
//  TopMenuButton.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class TopMenuButton: UIButton {
    
    enum TopMenuCategory {
        case tvProgram
        case movie
        case likeContents
        
        var title: String {
            switch self {
            case .tvProgram:        return "tv프로그램"
            case .movie:            return "영화"
            case .likeContents:     return "내가 찜한 콘텐츠"
            }
        }
    }
    
    init(category: TopMenuCategory) {
        super.init(frame: .zero)
        
        setTitle(category.title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TopMenuButton {
    
    func configureView() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 13.0, weight: .medium)
        backgroundColor = .clear
    }
}
