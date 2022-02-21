//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Caroline Davis on 21/2/22.
//

import Foundation

extension Double {
    /// Converts a double into a currency with 2decimal places
    /// ```
    /// Convert 1234.56 to $1,2345.56
    /// ```

    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    /// Converts a double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,2345.56"
    /// ```

    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }

    /// Converts a double into a currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,2345.56
    /// Convert 12.56 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```

    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    /// Converts a double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,2345.56"
    /// Convert 12.56 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```

    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }

    /// Converts a double into a String represention
    /// ```
    /// Convert 1234.56 to "1.23"
    /// ```

    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    /// Converts a double into a String represention with percent symbol
    /// ```
    /// Convert 1234.56 to "1.23%"
    /// ```

    func asPercentString() -> String {
        return asNumberString() + "%"
    }

}
