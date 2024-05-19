//
//  SocialLoginView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit
import SnapKit

final class SocialLoginView: UIView {
    private let divider = DividerView()
    
    let googleButton: SocialLoginButton = {
        let button = SocialLoginButton(title: "Sign up with Google", imageName: "google_logo")
        return button
    }()

    let appleButton: SocialLoginButton = {
        let button = SocialLoginButton(title: "Sign up with Apple", imageName: "apple_logo")
        return button
    }()
    
    private let contentVStackView: UIStackView = {
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
        contentVStackView.addArrangedSubview(googleButton)
        contentVStackView.addArrangedSubview(appleButton)
        contentVStackView.addArrangedSubview(divider)
        addSubview(contentVStackView)
    }
    
    private func configureConstraints() {
        contentVStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        googleButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        appleButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        divider.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
    }
}
