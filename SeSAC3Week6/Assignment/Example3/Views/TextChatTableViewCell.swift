//
//  TextChatTableViewCell.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class TextChatTableViewCell: UITableViewCell {
    
    // MARK: - UI
    private let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8.0
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "78% 만큼 습해요"
        label.numberOfLines = 0
       
        return label
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
    
    func configureCell(text: String?) {
        chatLabel.text = text
    }
}

// MARK: - Private
private extension TextChatTableViewCell {
    
    func setupLayout() {
        
        bubbleBackgroundView.addSubview(chatLabel)
        contentView.addSubview(bubbleBackgroundView)
        
        bubbleBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.0)
            $0.bottom.equalToSuperview().inset(8.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalTo(chatLabel.snp.trailing).offset(8.0)
        }
        
        chatLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8.0)
            $0.trailing.lessThanOrEqualTo(contentView.snp.trailing).offset(-28.0)
            $0.top.bottom.equalToSuperview().inset(8.0)
        }
    }
}
