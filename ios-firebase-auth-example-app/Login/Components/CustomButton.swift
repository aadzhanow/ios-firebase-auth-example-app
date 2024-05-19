//
//  CustomButton.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit

final class CustomButton: UIButton {
    init(title: String, backgroundColor: UIColor = .customBlue, titleColor: UIColor = .white) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .customFont(font: .poppins, style: .medium, size: .s16)
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
