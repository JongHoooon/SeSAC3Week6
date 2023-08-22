//
//  ImageChatTableViewCell.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class ImageChatTableViewCell: UITableViewCell {
    
    // MARK: - UI
    private let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let chatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLayout()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(image: UIImage?) {
        chatImageView.image = image
    }
}

// MARK: - Private
private extension ImageChatTableViewCell {
    
    func setupLayout() {
        
        bubbleBackgroundView.addSubview(chatImageView)
        contentView.addSubview(bubbleBackgroundView)
        
        bubbleBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.0)
            $0.bottom.equalToSuperview().inset(8.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalTo(chatImageView.snp.trailing).offset(8.0)
        }
        
        chatImageView.snp.makeConstraints {
            $0.width.equalTo(frame.width/2.0)
            $0.height.equalTo(chatImageView.snp.width).multipliedBy(2.0/3.0)
            $0.edges.equalToSuperview().inset(8.0)
        }
    }
}
