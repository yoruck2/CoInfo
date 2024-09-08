//
//  Double+.swift
//  CoInfo
//
//  Created by dopamint on 9/8/24.
//

import Foundation

extension Double {
    
    func formatToKRW() -> String {
        return "₩\(self.formatted())"
    }
    
    func formatToPercent() -> String {
        return String(format: "%.2f%%", self)
    }
}
