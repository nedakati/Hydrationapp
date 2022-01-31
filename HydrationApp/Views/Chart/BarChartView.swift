//
//  BarView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct BarChartView: View {
    
    let min: Int
    let max: Int
    
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
                    if data[index].intake >= UserStorageService.shared.targetDailyIntake {
                        Color(.lightGreen)
                            .frame(width: 4, height: height, alignment: .bottom)
                    } else {
                        Color(.yellow)
                            .frame(width: 4, height: height, alignment: .bottom)
                    }
                }
            }
        }
    }
}
