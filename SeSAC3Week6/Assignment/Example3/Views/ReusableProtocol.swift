//
//  ReusableProtocol.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import Foundation
import UIKit

protocol ReusableProtocol {}

extension ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableProtocol {}
