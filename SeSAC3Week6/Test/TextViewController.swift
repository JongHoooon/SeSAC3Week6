//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

import SnapKit

final class TextViewController: UIViewController {
    
    // 1.
    let picker = UIImagePickerController()
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15.0)
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    
        picker.delegate = self
        configureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        // 2. available
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
            return
        }
        
        // 카메라는 권한 필요함!
        picker.sourceType = .camera
        picker.allowsEditing = true
         */
        
//        let picker = UIFontPickerViewController()
//        let picker = UIColorPickerViewController()
        
        present(picker, animated: true)
    }
    
    func configureConstraints() {
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)
        
        [
            photoImageView,
            titleTextField
        ].forEach { view.addSubview($0) }
        
        photoImageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view).multipliedBy(0.3)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(20.0)
            $0.leadingMargin.equalTo(20.0)
            $0.trailingMargin.equalTo(-20.0)
            $0.height.equalTo(50.0)
        }
    }
}

extension TextViewController: UIImagePickerControllerDelegate,
                              UINavigationControllerDelegate {
    
    // 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}
