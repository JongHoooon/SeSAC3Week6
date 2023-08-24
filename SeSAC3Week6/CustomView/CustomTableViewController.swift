//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

final class CustomTableViewController: UIViewController {
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. 셀 높이 유동적으로 설정
        return view
    }()
    
//    private var isExpand = false // false 2, true 0
    
    var list = [
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀", isExpand: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        // uinib - xib 파일
        // 
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return list.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell")!
        cell.textLabel?.text = list[indexPath.row].text
        // 2. number of lines  // 3. 레이아웃 늘어날 수 있게 잘 만들어준다.
//        cell.textLabel?.numberOfLines =  ? 0 : 2
        
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        list[indexPath.row].isExpand.toggle()
        print(#function)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
