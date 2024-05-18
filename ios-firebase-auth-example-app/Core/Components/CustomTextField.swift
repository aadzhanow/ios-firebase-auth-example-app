//
//  CustomTextField.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit

enum TextFieldState {
    case editing, error, inActive
}

class CustomTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    public func updateTextFieldState(state: TextFieldState) {
        switch state {
        case .inActive:
            self.layer.borderColor = UIColor.clear.cgColor
        case .editing:
            self.layer.borderColor = UIColor.customBlue.cgColor
        case .error:
            self.layer.borderColor = UIColor.red.cgColor
        }
    }
}
