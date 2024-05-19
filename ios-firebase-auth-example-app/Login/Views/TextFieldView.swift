//
//  TextFieldView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit
import SnapKit

final class TextFieldView: UIView {
    let errorLabel: UILabel = {
        let label = UILabel()
//        label.text = "Error description"
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        label.textColor = .red
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .customLightGrey
        textField.placeholder = "email"
        textField.layer.cornerRadius = 14
        textField.clipsToBounds = true
        textField.returnKeyType = .next
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .customLightGrey
        textField.placeholder = "password"
        textField.layer.cornerRadius = 14
        textField.clipsToBounds = true
        textField.returnKeyType = .done
        return textField
    }()
    
    private let textfieldVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        textfieldVStackView.addArrangedSubview(errorLabel)
        textfieldVStackView.addArrangedSubview(emailTextField)
        textfieldVStackView.addArrangedSubview(passwordTextField)
        addSubview(textfieldVStackView)
    }
    
    private func configureConstraints() {
        textfieldVStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
