//
//  DevicePad.swift
//

import UIKit

enum Device {
    static var pad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    static var phone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    static var mac: Bool { UIDevice.current.userInterfaceIdiom == .mac }
    static var tv: Bool { UIDevice.current.userInterfaceIdiom == .tv }
    static var carPlay: Bool { UIDevice.current.userInterfaceIdiom == .carPlay }
}
