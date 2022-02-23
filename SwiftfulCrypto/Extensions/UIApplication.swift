//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 24/2/22.
//

import Foundation
import SwiftUI

extension UIApplication {

    // dismisses keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}
