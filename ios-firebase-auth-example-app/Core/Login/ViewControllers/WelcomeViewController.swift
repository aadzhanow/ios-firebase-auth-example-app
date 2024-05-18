//
//  WelcomeViewController.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    private let titleView = TitleView()
    private let divider = DividerView()
    
    private let signUpWithGoogleButton: SocialLoginButton = {
        let button = SocialLoginButton(title: "Sign up with Google", imageName: "google_logo")
        return button
    }()

    private let signUpWithAppleButton: SocialLoginButton = {
        let button = SocialLoginButton(title: "Sign up with Apple", imageName: "apple_logo")
        return button
    }()
    
    let contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customBlue
        button.setTitle("Sign up with Email", for: .normal)
        button.titleLabel?.font = .customFont(font: .poppins, style: .medium, size: .s16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .customBlack
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customBlue
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .customFont(font: .poppins, style: .medium, size: .s16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    
    let loginVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use."
        label.font = .customFont(font: .poppins, style: .regular, size: .s12)
        label.textColor = .customBlack
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureButtonActions()
    }
    
    @objc private func loginButtonTapped() {
        let vc = ReusableFormViewController(formState: .login)
        vc.modalPresentationStyle = .automatic
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func signUpButtonTapped() {
        let vc = ReusableFormViewController(formState: .register)
        vc.modalPresentationStyle = .automatic
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
}

extension WelcomeViewController {
    private func configureViews() {
        view.backgroundColor = .white
        view.addSubview(titleView)
        contentVStackView.addArrangedSubview(signUpWithGoogleButton)
        contentVStackView.addArrangedSubview(signUpWithAppleButton)
        view.addSubview(divider)
        view.addSubview(contentVStackView)
        view.addSubview(signUpButton)
        loginVStackView.addArrangedSubview(loginLabel)
        loginVStackView.addArrangedSubview(loginButton)
        view.addSubview(loginVStackView)
        view.addSubview(infoLabel)
    }
    
    private func configureConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height * 0.08)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
        }
        contentVStackView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(view.frame.height * 0.06)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
            make.height.equalTo(136)
        }
        divider.snp.makeConstraints { make in
            make.top.equalTo(contentVStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
            make.height.equalTo(22)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
            make.height.equalTo(60)
        }
        loginVStackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(62)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
            make.height.equalTo(98)
        }
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(AuthConstants.shared.padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    private func configureButtonActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
}
