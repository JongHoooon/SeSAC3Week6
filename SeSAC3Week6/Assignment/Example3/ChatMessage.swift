//
//  ChatMessage.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/22.
//

import UIKit

struct ChatMessage {
    enum ChatMessageType {
        case text
        case image
    }
    
    let chatMessageType: ChatMessageType
    let text: String?
    let image: UIImage?
    
    init(
        chatMessageType: ChatMessageType,
        text: String? = nil,
        image: UIImage? = nil
    ) {
        self.chatMessageType = chatMessageType
        self.text = text
        self.image = image
    }
}
