//
//  chartDummyDataResponse.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import Foundation

struct chartDummyData: Codable, CandlestickData {
    let x: Double
    let y: [Double]

    var time: Date {
        Date(timeIntervalSince1970: x / 1000)
    }

    var open: Double {
        y[0]
    }

    var close: Double {
        y[3]
    }

    var low: Double {
        y[2]
    }

    var high: Double {
        y[1]
    }
}

typealias chartDummyDataResponse = [chartDummyData]
