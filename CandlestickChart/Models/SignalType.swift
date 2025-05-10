//
//  SignalType.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 10/05/2025.
//

import SwiftUI

enum SignalType: String, CaseIterable {
    case sellFiltered = "Sell Signal (Filtered)"
    case buyUnfiltered = "Buy Signal (Unfiltered)"
    case sellUnfiltered = "Sell Signal (Unfiltered)"

    var color: Color {
        switch self {
        case .sellFiltered: return .red
        case .buyUnfiltered: return .green
        case .sellUnfiltered: return .red
        }
    }

    var image: Image {
        switch self {
        case .buyUnfiltered:
            return Image(systemName: "arrowtriangle.up")
        case .sellFiltered:
            return Image(systemName: "arrowtriangle.down.fill")
        case .sellUnfiltered:
            return Image(systemName: "arrowtriangle.down")
        }
    }
}
