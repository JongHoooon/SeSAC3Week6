//
//  NetflixMainViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class NetflixMainViewController: UIViewController {
    
    // MARK: - UI
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFill
        imageView.image = NetflixImageSpace.Poster.avengers
        return imageView
    }()
    
    // top menu
    private let topMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "N"
        label.font = .systemFont(ofSize: 32.0, weight: .black)
        label.textColor = .white
        return label
    }()
    private let tvProgramButton = TopMenuButton(category: .tvProgram)
    private let movieButton = TopMenuButton(category: .movie)
    private let likeContentsTopButton = TopMenuButton(category: .likeContents)
    
    // middle menu
    private let likeContentsMiddleButton: UIButton = {
        let button = UIButton()
        button.configuration = .middleMenu(type: .like)
        return button
    }()
    private let playButon: UIButton = {
        let button = UIButton()
        button.setImage(NetflixImageSpace.Icon.play, for: .normal)
        return button
    }()
    private let infoButtoon: UIButton = {
       let button = UIButton()
        button.configuration = .middleMenu(type: .info)
        return button
    }()
    
    // preview
    private let previewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    private let firstPreviewImageView = PreviewImageView(image: NetflixImageSpace.Poster.frozen)
    private let secondPreviewImageView = PreviewImageView(image: NetflixImageSpace.Poster.withGod)
    private let thirdPreviewImageView = PreviewImageView(image: NetflixImageSpace.Poster.avatar)
    
    private let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        view.backgroundColor = .black
    }
}

private extension NetflixMainViewController {
    
    func configureLayout() {
        
        [
            tvProgramButton,
            movieButton,
            likeContentsTopButton
        ].forEach { topMenuStackView.addArrangedSubview($0) }

        [
            firstPreviewImageView,
            secondPreviewImageView,
            thirdPreviewImageView
        ].forEach { imageView in
            previewStackView.addArrangedSubview(imageView)
            imageView.snp.makeConstraints {
                $0.height.equalTo(imageView.snp.width)
            }
        }
        
        [
            backgroundImageView,
            logoLabel,
            topMenuStackView,
            likeContentsMiddleButton,
            playButon,
            infoButtoon,
            previewLabel,
            previewStackView
        ].forEach { view.addSubview($0) }
        
        backgroundImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100.0)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32.0)
            $0.leading.equalToSuperview().inset(8.0)
        }
        logoLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        topMenuStackView.snp.makeConstraints {
            $0.centerY.equalTo(logoLabel)
            $0.leading.equalTo(logoLabel.snp.trailing).offset(32.0)
            $0.trailing.equalToSuperview().inset(32.0)
        }
        topMenuStackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        previewStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(32.0)
            $0.horizontalEdges.equalToSuperview(.init(8.0))
        }
        previewLabel.snp.makeConstraints {
            $0.bottom.equalTo(previewStackView.snp.top).offset(-4.0)
            $0.leading.equalToSuperview().inset(4.0)
        }
        
        playButon.snp.makeConstraints {
            $0.centerX.equalTo(secondPreviewImageView)
            $0.bottom.equalTo(previewLabel.snp.top).offset(-20.0)
        }
        likeContentsMiddleButton.snp.makeConstraints {
            $0.centerX.equalTo(firstPreviewImageView)
            $0.centerY.equalTo(playButon)
        }
        infoButtoon.snp.makeConstraints {
            $0.centerX.equalTo(thirdPreviewImageView)
            $0.centerY.equalTo(playButon)
        }
    }
}
