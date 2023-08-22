//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

import SnapKit

/*
 add Subview
 superView
 offset, inset

 RTL(Right to Left)
 
 */

final class SnapViewController: UIViewController {
 
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints {
            $0.width.equalTo(200.0)
            $0.height.equalTo(150.0)
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(200.0)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200.0)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints {
//            $0.size.equalTo(150.0)
//            $0.leading.top.equalToSuperview()
//            $0.edges.equalTo(blueView).offset(50.0)
            $0.edges.equalTo(blueView).inset(50.0)
        }
    }
}
