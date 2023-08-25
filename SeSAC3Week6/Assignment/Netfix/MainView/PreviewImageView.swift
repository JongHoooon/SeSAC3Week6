//
//  PreviewImageView.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class PreviewImageView: UIImageView {
    
    // MARK: - Init
    override init(image: UIImage?) {
        super.init(frame: .zero)
        self.image = image
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2.0
    }
}

// MARK: - Private
private extension PreviewImageView {
    func configureView() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.borderColor = UIColor.systemGray.cgColor
        layer.borderWidth = 2.0
    }
}
