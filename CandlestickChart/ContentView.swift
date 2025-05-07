//
//  ContentView.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 06/05/2025.
//

import SwiftUI
import Charts

struct ContentView: View {
    let candles: [Candle] = [
        .init(open: 100, close: 105, low: 98, high: 108),   // Bullish
        .init(open: 105, close: 102, low: 100, high: 110),  // Bearish
        .init(open: 102, close: 108, low: 101, high: 112),  // Strong up
        .init(open: 108, close: 103, low: 99, high: 109),   // Pullback
        .init(open: 103, close: 103, low: 100, high: 106),  // Doji
        .init(open: 103, close: 110, low: 102, high: 113),  // Breakout
        .init(open: 110, close: 108, low: 107, high: 114),  // Slight drop
        .init(open: 108, close: 111, low: 106, high: 115),  // Steady climb
        .init(open: 111, close: 107, low: 105, high: 113),  // Reversal
        .init(open: 107, close: 104, low: 102, high: 108),  // Downtrend
        .init(open: 104, close: 109, low: 103, high: 110),  // Bounce back
        .init(open: 109, close: 113, low: 108, high: 116)   // New high
    ]

    
    var body: some View {
        Chart {
            ForEach(Array(zip(candles.indices, candles)), id: \.1) { index, candle in
                RectangleMark(
                    x: .value("index", index),
                    yStart: .value("low", candle.low),
                    yEnd: .value("high", candle.high),
                    width: 1
                )
                
                RectangleMark(
                    x: .value("index", index),
                    yStart: .value("open", candle.open),
                    yEnd: .value("close", candle.close),
                    width: 4
                )
                .foregroundStyle(.red)
            }
        }
        //TODO: check this 
        // .chartXScale(range: T##PositionScaleRange)
        .padding(50)
    }
}

#Preview {
    ContentView()
}

struct Candle: Hashable {
    let open: Double
    let close: Double
    let low: Double
    let high: Double
}
