//
//  chartDummyDataResponse.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import Foundation
struct chartDummyData: Codable {
    let x: Double
    let y: [Double]
}

typealias chartDummyDataResponse = [chartDummyData]
