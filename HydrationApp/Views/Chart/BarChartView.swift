//
//  BarView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct BarView: View {
    var color: Color

    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [color]), startPoint: .top, endPoint: .bottom)
    }

    var body: some View {
        Rectangle()
            .fill(gradient)
        
    }
}


struct BarChartView: View {
    
    let min: Int
    let max: Int
    
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DailyIntakeEntity.date, ascending: true)],
        animation: .default)
    private var data: FetchedResults<DailyIntakeEntity>
    
    private let spacing: CGFloat = 8
  
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 4.0) {
                ForEach(data.indices, id: \.self) { index in
                    let height = geometry.size.height * CGFloat(data[index].intake) / CGFloat(max)

                    BarView(color: data[index].intake >= UserStorageService.shared.targetDailyIntake ? Color(.lightGreen) : Color(.yellow))
                        .frame(width: 4, height: height, alignment: .bottom)
                }
            }
        }
    }
}
