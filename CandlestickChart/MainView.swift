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
    
    //if possable make it the the protocol level
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
                    x: .value("Index", candle.time),
                    low: .value("Low", candle.low),
                    high: .value("High", candle.high),
                    open: .value("Open", candle.open),
                    close: .value("Close", candle.close)
                )
                .foregroundStyle(candle.open < candle.close ? .green : .red)
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
