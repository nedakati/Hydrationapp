//
//  BarChart.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct BarChart: View {
        
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DailyIntakeEntity.date, ascending: true)],
        animation: .default)
    private var data: FetchedResults<DailyIntakeEntity>
    
    private let gridColor: Color = Color(.lightGray)
    private let spacing: CGFloat = 50

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack {
                ChartGrid(divisions: 4)
                    .stroke(gridColor, lineWidth: 0.5)
        
                BarChartView(min: 0,
                        max: data.map { Int($0.intake) }.max() ?? 0)
            }
            HStack(alignment: .bottom, spacing: 4.0) {
                ForEach(data.indices, id: \.self) { index in
                    Color.white
                        .frame(width: 4, height: 4)
                }
            }
            
            HStack {
                Text(data.compactMap { $0.date}.min()?.formatted(style: .short) ?? "")
                    .font(.caption)
                Spacer()
                Text(data.compactMap { $0.date}.max()?.formatted(style: .short) ?? "")
                    .font(.caption)
            }
        }
        .padding([.horizontal, .top], 20)
    }
}
