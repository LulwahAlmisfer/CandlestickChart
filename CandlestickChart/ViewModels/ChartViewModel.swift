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
      //  loadCandlesChartDymmyDataFromJSON()
        loadEma_crossover_results_iosFromJSON()
    }
    
    func loadCandlesChartDymmyDataFromJSON() {
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
    
    func loadEma_crossover_results_iosFromJSON(){
        guard let url = Bundle.main.url(forResource: "ema_crossover_results_ios", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(emaCrossoverResultsIosResponse.self, from: data)
            self.candles = response
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
