//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.text = "저네릭 테스트"
        sampleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(100.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20.0)
            $0.height.equalTo(50.0)
        }
        
        view.addSubview(sampleButton)
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(100.0)
            $0.top.equalTo(sampleLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(50.0)
        }
        
        let generic = sum(a: 3.0, b: 30.0)
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
        
        title = "타이틀틀!"
    }
}

