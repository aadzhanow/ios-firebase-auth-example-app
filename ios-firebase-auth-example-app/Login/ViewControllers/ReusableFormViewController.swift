//
//  ReusableFormViewController.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit
import SnapKit
import ProgressHUD

enum FormState {
    case login
    case register
}

final class ReusableFormViewController: UIViewController {
    private let sessionManager = SessionManager.shared
    
    private var currentFormState: FormState
    private let titleView = TitleView()
    private let socialLogin = SocialLoginView()
    private let textFieldView = TextFieldView()
    private let checkbox = CheckboxView()
    private let confirmView = ConfirmationView()
    
    private let contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    init(formState: FormState) {
        self.currentFormState = formState
        super.init(nibName: nil, bundle: nil)
        updateUI(state: currentFormState)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureButtonActions()
        updateUI(state: currentFormState)
        textFieldView.emailTextField.delegate = self
        textFieldView.passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backImage = UIImage(named: "arrow_back")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func updateUI(state: FormState) {
        switch state {
        case .login:
            titleView.titleLabel.text = "Sign In"
            titleView.subTitleLabel.text = "Welcome back! Please enter your details to log in to your account."
            confirmView.confirmButton.setTitle("Log In", for: .normal)
            confirmView.infoLabel.text = "Do you have account? Sign In"
            checkbox.isHidden = true
            socialLogin.isHidden = false
        case .register:
            titleView.titleLabel.text = "Sign Up"
            titleView.subTitleLabel.text = "Join our community! Create an account to enjoy all the benefits and start your journey with us."
            confirmView.confirmButton.setTitle("Create Account", for: .normal)
            confirmView.infoLabel.text = "Don’t have account? Sign Up"
            checkbox.isHidden = false
            socialLogin.isHidden = true
        }
    }
    
    @objc private func confirmButtonTapped() {
        
        guard let email = textFieldView.emailTextField.text, !email.isEmpty else {
            textFieldView.errorLabel.text = "Please enter your email"
            return
        }
        
        guard let password = textFieldView.passwordTextField.text, !password.isEmpty else {
            textFieldView.errorLabel.text = "Please enter your password"
            return
        }
        
        showActivityIndicator()
        
        switch currentFormState {
        case .login:
            sessionManager.login(email: email, password: password) { success, error in
                DispatchQueue.main.async {
                    if success {
                        ProgressHUD.dismiss()
                        print("Login successful")
                        self.handleLogin()
                    } else if let error = error {
                        ProgressHUD.dismiss()
                        print("Login failed: \(error.localizedDescription)")
                        self.textFieldView.errorLabel.text = "\(error.localizedDescription)"
                    }
                }
            }
        case .register:
            sessionManager.register(email: email, password: password) { success, error in
                DispatchQueue.main.async {
                    if success {
                        ProgressHUD.dismiss()
                        print("Registration successful")
                        self.handleLogin()
                    } else if let error = error {
                        ProgressHUD.dismiss()
                        print("Registration failed: \(error.localizedDescription)")
                        self.textFieldView.errorLabel.text = "\(error.localizedDescription)"
                    }
                }
            }
        }
    }
    
    private func handleLogin() {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        SceneDelegate.shared?.changeRootViewController(to: navigationController, animated: true)
    }
    
    private func showActivityIndicator() {
        ProgressHUD.animationType = .circleArcDotSpin
        ProgressHUD.colorAnimation = .customBlue
        ProgressHUD.animate("Please Wait...", interaction: false)
    }
}

private extension ReusableFormViewController {
    private func configureViews() {
        view.backgroundColor = .white
        view.addSubview(titleView)
        contentVStackView.addArrangedSubview(socialLogin)
        contentVStackView.addArrangedSubview(textFieldView)
        contentVStackView.addArrangedSubview(checkbox)
        contentVStackView.addArrangedSubview(confirmView)
        view.addSubview(contentVStackView)
    }
    
    private func configureConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height * 0.06)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
        }
        contentVStackView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(AuthConstants.padding)
        }
    }
    
    private func configureButtonActions() {
        confirmView.confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
}

extension ReusableFormViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let customTextField = textField as? CustomTextField {
            customTextField.updateTextFieldState(state: .editing)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let customTextField = textField as? CustomTextField {
            customTextField.updateTextFieldState(state: .inActive)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldView.emailTextField {
            textFieldView.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
