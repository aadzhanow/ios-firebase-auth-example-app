//
//  TitleView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit
import SnapKit

final class TitleView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to OS"
        label.font = .customFont(font: .poppins, style: .semiBold, size: .s32)
        label.textColor = .customBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login or Sign up to access your account"
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        label.textColor = .customBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let contentVStackView: UIStackView = {
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
        contentVStackView.addArrangedSubview(titleLabel)
        contentVStackView.addArrangedSubview(subTitleLabel)
        addSubview(contentVStackView)
    }
    
    private func configureConstraints() {
        contentVStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
