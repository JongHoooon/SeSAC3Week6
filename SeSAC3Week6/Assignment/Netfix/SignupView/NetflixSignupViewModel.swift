//
//  NetflixSignupViewModel.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/09/12.
//

import Foundation

final class NetflixSignupViewModel {
    let id = Observable(value: "")
    let password = Observable(value: "")
    let nickname = Observable(value: "")
    let location = Observable(value: "")
    let recommendation = Observable(value: "")
    let isSingUpButtonEnable = Observable(value: false)
    
    func checkValidation() {
        if id.value.count > 6
            && password.value.count > 4
            && nickname.value.count > 4
            && location.value.count > 4
            && recommendation.value.count > 4 {
            isSingUpButtonEnable.value = true
        } else {
            isSingUpButtonEnable.value = false
        }
    }
    
    func signup(completion: @escaping () -> Void) {
        print("회원 가입 성공!")
        completion()
    }
}
