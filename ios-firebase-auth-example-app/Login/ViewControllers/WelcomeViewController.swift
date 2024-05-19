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
    private let socialSignUp = SocialLoginView()
    
    private let signUpButton = CustomButton(title: "Sign Up")
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .customBlack
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        return label
    }()
    
    private let loginButton = CustomButton(title: "Log in")
    
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
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    @objc private func loginButtonTapped() {
        let vc = ReusableFormViewController(formState: .login)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func signUpButtonTapped() {
        let vc = ReusableFormViewController(formState: .register)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WelcomeViewController {
    private func configureViews() {
        view.backgroundColor = .white
        view.addSubview(titleView)
        view.addSubview(socialSignUp)
        view.addSubview(signUpButton)
        loginVStackView.addArrangedSubview(loginLabel)
        loginVStackView.addArrangedSubview(loginButton)
        view.addSubview(loginVStackView)
        view.addSubview(infoLabel)
    }
    
    private func configureConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height * 0.08)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
        }
        socialSignUp.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(view.frame.height * 0.06)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)

        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(socialSignUp.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
            make.height.equalTo(60)
        }
        loginVStackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(62)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
            make.height.equalTo(98)
        }
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    private func configureButtonActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
}
