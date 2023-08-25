//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
  
    let label = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()  // addSubview 이후에 constraints 설정
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        // view.addSubview(label) // Cell 에는 view 없음, contentView 사용해야함
        // addSubview(label)      // 에러는 발생안하는데 layout 이상해질 수 있음.
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setConstraints() {
        button.snp.makeConstraints {
            $0.size.equalTo(30.0)
            $0.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints {
            $0.top.leadingMargin.bottom.equalTo(contentView)
            $0.trailing.equalTo(button.snp.leadingMargin).inset(8.0)
        }
    }
    
    // Interface Builder 통해서 만들어질 때 사용한다.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Intialization code
    }
}
