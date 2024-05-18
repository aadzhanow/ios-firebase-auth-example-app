//
//  AuthConstants.swift
//

import UIKit

final class AuthConstants {
    static let shared = AuthConstants()
    public var privacyLink: String = "https://www.google.com/"
    public var termsLink: String = "https://www.google.com/"

    public var padding: CGFloat { Device.pad ? 80 : 20 }
}
