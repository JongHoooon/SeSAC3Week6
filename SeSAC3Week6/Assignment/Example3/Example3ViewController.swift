//
//  Example3ViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

final class Example3ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let chats = [
        ChatMessage(chatMessageType: .text, text: "지금은 9°C 예요"),
        ChatMessage(chatMessageType: .text, text: "78% 만큼 습해요"),
        ChatMessage(chatMessageType: .text, text: "1 m/s의 바람이 불어요"),
        ChatMessage(chatMessageType: .image, image: UIImage(systemName: "cloud.fill")),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다.내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다."),
        ChatMessage(chatMessageType: .text, text: "오늘도 행복한 하루 보내세요"),
        ChatMessage(chatMessageType: .text, text: "내일은 비가 올 예정입니다.")
    ]
    
    // MARK: - UI
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .white
        label.text = "10월 24일 09시 42분"
        
        return label
    }()
    
    private let dashboardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20.0
        stackView.alignment = .center
        stackView.distribution = .fill
        
        return stackView
    }()
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")?
            .withTintColor(
            .white,
            renderingMode: .alwaysOriginal
        )
        
        return imageView
    }()
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "서울, 신림동"
        label.font = .systemFont(ofSize: 19.0, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "square.and.arrow.up")?
                .withTintColor(.white, renderingMode: .alwaysOriginal),
            for: .normal
        )
        
        return button
    }()
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "arrow.clockwise")?
                .withTintColor(.white, renderingMode: .alwaysOriginal),
            for: .normal
        )
        
        return button
    }()
    
    private let chattingTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupLayout()
        configureTableView()
    }
}

// MARK: - Table View

extension Example3ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return chats.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let row = chats[indexPath.row]
        switch row.chatMessageType {
        case .text:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextChatTableViewCell.identifier,
                for: indexPath
            ) as? TextChatTableViewCell else { return UITableViewCell() }
            cell.configureCell(text: row.text)
            
            return cell
        case .image:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ImageChatTableViewCell.identifier,
                for: indexPath
            ) as? ImageChatTableViewCell else { return UITableViewCell() }
            cell.configureCell(image: row.image)
            
            return cell
        }
    }
}

extension Example3ViewController: UITableViewDelegate {
    
}

private extension Example3ViewController {
    func configureTableView() {
        chattingTableView.register(
            TextChatTableViewCell.self,
            forCellReuseIdentifier: TextChatTableViewCell.identifier
        )
        chattingTableView.register(
            ImageChatTableViewCell.self,
            forCellReuseIdentifier: ImageChatTableViewCell.identifier)
        
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
    }
}

// MARK: - Private

private extension Example3ViewController {
    
    func setupLayout() {
        [
            locationImageView,
            locationLabel,
            shareButton,
            refreshButton
        ].forEach { dashboardStackView.addArrangedSubview($0) }
        
        [
            backgroundImageView,
            timeLabel,
            dashboardStackView,
            chattingTableView
        ].forEach { view.addSubview($0) }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(28.0)
        }
        
        dashboardStackView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(20.0)
            $0.horizontalEdges.equalToSuperview().inset(20.0)
        }
        locationImageView.snp.makeConstraints {
            $0.size.equalTo(32.0)
        }
        locationLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        locationLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        locationImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        chattingTableView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(dashboardStackView.snp.bottom).offset(20.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
