//
//  Candle.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import Foundation
// should be the protocol with time
struct Candle: Hashable,Codable {
    let open: Double
    let close: Double
    let low: Double
    let high: Double
}
