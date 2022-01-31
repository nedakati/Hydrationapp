//
//  HistoryView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

import CoreData

struct HistoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DailyIntakeEntity.date, ascending: true)],
        animation: .default)
    private var items: FetchedResults<DailyIntakeEntity>

    private let chartHeight: CGFloat = 300
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here you can see your hydration data for the last 30 days")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                BarChart()
                    .frame(height: chartHeight)
                
                List {
                    ForEach(items) { item in
                        HistoryCellView(item: item)
                    }
                }
            }
            .navigationBarTitle("History", displayMode: .inline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
