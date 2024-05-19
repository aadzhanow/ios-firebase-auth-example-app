//
//  AuthConstants.swift
//

import UIKit

struct AuthConstants {
    static let shared = AuthConstants()
    static let privacyLink: String = "https://www.google.com/"
    static let termsLink: String = "https://www.google.com/"

    static var padding: CGFloat { UIDevice.current.userInterfaceIdiom == .pad ? 80 : 20 }
}
