//
//  Candle.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import Foundation

protocol CandlestickData {
    var time: Date { get }
    var open: Double { get }
    var close: Double { get }
    var low: Double { get }
    var high: Double { get }
}

extension Array where Element: CandlestickData {
    func yAxisRange(padding: Double = 0.05) -> ClosedRange<Double>? {
        guard let minLow = self.map(\.low).min(),
              let maxHigh = self.map(\.high).max() else {
            return nil
        }

        let range = maxHigh - minLow
        let paddedMin = minLow - range * padding
        let paddedMax = maxHigh + range * padding
        return paddedMin...paddedMax
    }
}
