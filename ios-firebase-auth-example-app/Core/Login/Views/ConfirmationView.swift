//
//  ConfirmationView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit
import SnapKit

final class ConfirmationView: UIView {
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customBlue
        button.titleLabel?.font = .customFont(font: .poppins, style: .medium, size: .s16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        label.textColor = .customBlack
        return label
    }()
    
    private let confirmVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
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
        confirmVStackView.addArrangedSubview(confirmButton)
        confirmVStackView.addArrangedSubview(infoLabel)
        addSubview(confirmVStackView)
    }
    
    private func configureConstraints() {
        confirmVStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        confirmButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
