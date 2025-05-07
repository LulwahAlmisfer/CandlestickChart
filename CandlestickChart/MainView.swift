//
//  MainView.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 06/05/2025.
//

import SwiftUI
import Charts

struct MainView: View {
//    let candles: [Candle] = [
//        .init(open: 100, close: 105, low: 98, high: 108),   // Bullish
//        .init(open: 105, close: 102, low: 100, high: 110),  // Bearish
//        .init(open: 102, close: 108, low: 101, high: 112),  // Strong up
//        .init(open: 108, close: 103, low: 99, high: 109),   // Pullback
//        .init(open: 103, close: 103, low: 100, high: 106),  // Doji
//        .init(open: 103, close: 110, low: 102, high: 113),  // Breakout
//        .init(open: 110, close: 108, low: 107, high: 114),  // Slight drop
//        .init(open: 108, close: 111, low: 106, high: 115),  // Steady climb
//        .init(open: 111, close: 107, low: 105, high: 113),  // Reversal
//        .init(open: 107, close: 104, low: 102, high: 108),  // Downtrend
//        .init(open: 104, close: 109, low: 103, high: 110),  // Bounce back
//        .init(open: 109, close: 113, low: 108, high: 116)   // New high
//    ]
    
    @StateObject var viewModel = ChartViewModel()
    
    var body: some View {
        Chart {
            ForEach(viewModel.candles.indices, id: \.self) { index in
                let candle = viewModel.candles[index]
                CandlestickMark(
                    x: .value("Index", candle.time),
                    low: .value("Low", candle.low),
                    high: .value("High", candle.high),
                    open: .value("Open", candle.open),
                    close: .value("Close", candle.close)
                )
                .foregroundStyle(candle.open < candle.close ? .green : .red)
            }
        }
        .frame(height:500)
        .padding(20)
    }
}

#Preview {
    MainView()
}
