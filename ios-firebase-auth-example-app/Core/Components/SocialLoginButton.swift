//
//  SocialLoginButton.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit

final class SocialLoginButton: UIButton {
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        self.backgroundColor = .customLightGrey
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .customFont(font: .poppins, style: .medium, size: .s16)
        self.setTitleColor(.customBlack, for: .normal)
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
