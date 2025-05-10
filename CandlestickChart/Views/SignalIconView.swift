//
//  SignalIconView.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 10/05/2025.
//

import SwiftUI

struct SignalIconView: View {
    var signal: SignalType?
    var body: some View {
        if let signal {
            signal.image
                .foregroundStyle(signal.color)
                .font(.caption2)
        } else {
            EmptyView()
        }
    }
}
