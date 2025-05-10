//
//  SignalLegendView.swift
//  CandlestickChart
//
//  Created by Lulwah almisfer on 10/05/2025.
//

import SwiftUI

struct SignalLegendView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Indicatores")
            priceLegend
            ema12Legend
            ema26Legend
            sma50Legend
            ForEach(SignalType.allCases, id: \.self) { type in
                HStack {
                    type.image
                        .foregroundStyle(type.color)
                    Text(type.rawValue)
                        .font(.caption)
                }
                
            }
        }
        .padding()
    }
    
    var ema12Legend: some View {
        HStack(spacing: 6) {
            ColorBox(color: .orange)
            Text("EMA(12)").font(.caption)
        }
    }
    
    var ema26Legend: some View {
        HStack(spacing: 6) {
            ColorBox(color: .blue)
            Text("EMA(26)").font(.caption)
        }
    }
    
    var sma50Legend: some View {
        HStack(spacing: 6) {
            DashedColorBox(color: .gray)
            Text("SMA(50)").font(.caption)
        }
    }
    
    var priceLegend: some View {
        HStack(spacing: 6) {
            ColorBox(color: .green)
            Text("Price").font(.caption)
        }
    }
}

struct ColorBox: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(color)
            .frame(width: 30, height: 4)
    }
}

struct DashedColorBox: View {
    let color: Color
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(color)
                .frame(width: 12, height: 4)
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(color)
                .frame(width: 12, height: 4)

        }
        
    }
}
