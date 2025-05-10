//
//  MainView.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 06/05/2025.
//

import SwiftUI
import Charts

struct MainView: View {
    
    @StateObject var viewModel = ChartViewModel()
    
    // TODO: if possable make it the the protocol level 🔴
    var yRange: ClosedRange<Double> {
        guard let min = viewModel.candles.map(\.low).min(),
              let max = viewModel.candles.map(\.high).max() else {
            return 0...1
        }
        
        let padding = (max - min) * 0.1
        return (min - padding)...(max + padding)
    }
    
    
    var body: some View {
        
        Chart {
            ForEach(viewModel.candles.indices, id: \.self) { index in
                let candle = viewModel.candles[index]
                CandlestickMark(
                    x: .value("Time", candle.date),
                    low: .value("Low", candle.low),
                    high: .value("High", candle.high),
                    open: .value("Open", candle.open),
                    close: .value("Close", candle.close)
                )
                .foregroundStyle(candle.open < candle.close ? .green : .red)
            }
            
            // TODO: what are series? 🔴
            if let emaCandles = viewModel.candles as? [emaCrossoverResultsIos] {
                ForEach(emaCandles, id: \.date) { candle in
                    LineMark(x: .value("Time", candle.date), y: .value("EMA(12)", candle.shortEMA),
                             series: .value("EMA(12)", "A")
                    )
                    .foregroundStyle(.orange)
                }
                
                ForEach(emaCandles, id: \.date) { candle in
                    LineMark(x: .value("Time", candle.date), y: .value("EMA(26)", candle.longEMA),
                             series: .value("EMA(26)", "B")
                    )
                    .foregroundStyle(.blue)
                }
            }
        }
        .chartYScale(domain: yRange)
        .frame(height:500)
        .padding(30)
        
    }
}

#Preview {
    MainView()
}
