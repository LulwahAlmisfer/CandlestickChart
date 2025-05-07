//
//  ChartViewModel.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import SwiftUI
import Charts

class ChartViewModel: ObservableObject {
    @Published var candles: [Candle] = []

    init() {
        loadCandlesFromJSON()
    }
    func loadCandlesFromJSON() {
        guard let url = Bundle.main.url(forResource: "chartDymmyData", withExtension: "json") else {
            print("JSON file not found.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(chartDummyDataResponse.self, from: data)
            
            self.candles = response.map {
                Candle(
                    // If your Candle model has `time`, uncomment this line:
                    // time: $0.x / 1000, // from milliseconds to seconds
                    open: $0.y[0],
                    close: $0.y[3],
                    low: $0.y[2],
                    high: $0.y[1]
                )
            }
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
