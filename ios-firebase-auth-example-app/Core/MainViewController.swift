//
//  MainViewController.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureButtonActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension MainViewController {
    private func configureViews() {
        view.backgroundColor = .red
    }
    
    private func configureConstraints() {
        
    }
    
    private func configureButtonActions() {
        
    }
}
