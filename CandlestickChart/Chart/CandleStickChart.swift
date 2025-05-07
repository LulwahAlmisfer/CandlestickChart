//
//  CandleStickChart.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import SwiftUI
import Charts

struct CandlestickMark<X: Plottable, Y: Plottable>: ChartContent {
    let x: PlottableValue<X>
    let low: PlottableValue<Y>
    let high: PlottableValue<Y>
    let open: PlottableValue<Y>
    let close: PlottableValue<Y>
    
    init(
        x: PlottableValue<X>,
        low: PlottableValue<Y>,
        high: PlottableValue<Y>,
        open: PlottableValue<Y>,
        close: PlottableValue<Y>
    ) {
        self.x = x
        self.low = low
        self.high = high
        self.open = open
        self.close = close
    }
    
    var body: some ChartContent {
        RectangleMark(x: x, yStart: low, yEnd: high, width: 1)
            .foregroundStyle(.black)
        RectangleMark(x: x, yStart: open, yEnd: close, width: 6)
    }
}
