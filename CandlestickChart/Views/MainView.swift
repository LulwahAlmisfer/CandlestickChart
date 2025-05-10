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
        HStack(alignment: .top){
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
                    
                    ForEach(emaCandles, id: \.date) { candle in
                        if let signal = candle.signal {
                            PointMark(
                                x: .value("Time", candle.date),
                                y: .value("High", candle.longEMA)
                            )
                            .foregroundStyle(.clear)
                            .annotation(position: signal == .buyUnfiltered ? .bottom : .top) {
                                SignalIconView(signal: signal)
                            }
                        }
                    }
                    
                    ForEach(emaCandles, id: \.date) { candle in
                        LineMark(x: .value("Time", candle.date), y: .value("SMA(50)", candle.trendFilterMA),
                                 series: .value("SMA(50)", "C")
                        )
                        .foregroundStyle(.gray)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [6]))
                    }
                    
                }
            }
            .chartXAxis { // TODO: clean with modif
                AxisMarks(values: .automatic(desiredCount: 6)) { value in
                    if let date = value.as(Date.self) {
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel {
                            Text(date.formatted(.dateTime.month(.abbreviated).year()))
                        }
                    }
                }
            }
            .chartYScale(domain: yRange)
            .frame(height:500)
            .padding(30)
            SignalLegendView()
            
        }
    }
}

#Preview {
    MainView()
}

