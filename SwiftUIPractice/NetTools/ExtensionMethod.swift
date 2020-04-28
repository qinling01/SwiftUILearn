//
//  ExtensionMethod.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/4/27.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UIDevice {
    /// 判断X以上机型
    func isiPhoneXMore() -> Bool {
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0 > 0.0 ? true : false
    }
}
