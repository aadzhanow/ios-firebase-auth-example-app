//
//  DividerView.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 17.05.2024.
//

import UIKit
import SnapKit

final class DividerView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .customFont(font: .poppins, style: .regular, size: .s14)
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customBlack.withAlphaComponent(0.3)
        return view
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
        addSubview(dividerView)
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        dividerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(44)
        }
    }
}
