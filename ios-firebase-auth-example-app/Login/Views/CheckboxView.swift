//
//  CheckboxView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 18.05.2024.
//

import UIKit
import SnapKit

final class CheckboxView: UIView {
    public var isChecked = false
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customBlack
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        label.text = "I’m agree to The Terms of Service and Privacy Policy"
        return label
    }()
    
    private let checkboxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "check-off")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .customBlue
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configureConstraints()
        configureGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addSubview(checkboxImageView)
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        checkboxImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.leading.equalTo(checkboxImageView.snp.trailing).offset(12)
        }
    }
    
    private func configureGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(checkboxTapped))
        checkboxImageView.addGestureRecognizer(gesture)
    }
    
    @objc private func checkboxTapped() {
        print("checkbox tapped")
        toggle()
    }
    
    private func toggle() {
        self.isChecked = !self.isChecked
            
        if self.isChecked {
            checkboxImageView.image = UIImage(named: "check-on")
        } else {
            checkboxImageView.image = UIImage(named: "check-off")
        }
    }
}
