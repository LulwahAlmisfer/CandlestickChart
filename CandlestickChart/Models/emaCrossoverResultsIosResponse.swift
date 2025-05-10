//
//  emaCrossoverResultsIosResponse.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 10/05/2025.
//

import Foundation
struct emaCrossoverResultsIos: Codable,CandlestickData {
    let date: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Int
    let shortEMA: Double
    let longEMA: Double
    let trendFilterMA: Double
    let signalUnfiltered: String?
    let signalFiltered: String?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case open = "Open"
        case high = "High"
        case low = "Low"
        case close = "Close"
        case volume = "Volume"
        case shortEMA = "ShortEMA"
        case longEMA = "LongEMA"
        case trendFilterMA = "TrendFilterMA"
        case signalUnfiltered = "SignalUnfiltered"
        case signalFiltered = "SignalFiltered"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateString = try container.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        guard let parsedDate = formatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription: "Invalid date format")
        }

        date = parsedDate
        self.open = try container.decode(Double.self, forKey: .open)
        self.high = try container.decode(Double.self, forKey: .high)
        self.low = try container.decode(Double.self, forKey: .low)
        self.close = try container.decode(Double.self, forKey: .close)
        self.volume = try container.decode(Int.self, forKey: .volume)
        self.shortEMA = try container.decode(Double.self, forKey: .shortEMA)
        self.longEMA = try container.decode(Double.self, forKey: .longEMA)
        self.trendFilterMA = try container.decode(Double.self, forKey: .trendFilterMA)
        self.signalUnfiltered = try container.decodeIfPresent(String.self, forKey: .signalUnfiltered)
        self.signalFiltered = try container.decodeIfPresent(String.self, forKey: .signalFiltered)
    }
    
}

typealias emaCrossoverResultsIosResponse = [emaCrossoverResultsIos]
