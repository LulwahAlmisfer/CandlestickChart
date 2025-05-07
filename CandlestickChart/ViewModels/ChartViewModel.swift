//
//  ChartViewModel.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 07/05/2025.
//

import SwiftUI
import Charts

class ChartViewModel: ObservableObject {
    @Published var candles: [any CandlestickData] = []

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
            self.candles = response
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
