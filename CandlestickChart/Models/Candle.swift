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
    var yRange: ClosedRange<Double>? {
        guard let min = map(\.low).min(), let max = map(\.high).max() else { return nil }
        return min...max
    }
}

