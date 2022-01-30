//
//  HistoryView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI
import BarChart

struct HistoryView: View {
    
    private let chartHeight: CGFloat = 300
    private let config = ChartConfiguration()
    
    var body: some View {
        VStack {
            Text("Here you can see your hydration data for the last 30 days")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            SelectableBarChartView<SelectionLine>(config: self.config)
            .onBarSelection { entry, location in
//                self.selectedBarTopCentreLocation = location
//                self.selectedEntry = entry
            }
            .onAppear() {
                let labelsFont = CTFontCreateWithName(("SFProText-Regular" as CFString), 10, nil)
                self.config.data.entries = self.randomEntries()
                self.config.data.color = .red
                self.config.xAxis.labelsColor = .gray
                self.config.xAxis.ticksColor = .gray
                self.config.labelsCTFont = labelsFont
                self.config.xAxis.ticksStyle = StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [2, 4])
                self.config.yAxis.labelsColor = .gray
                self.config.yAxis.ticksColor = .gray
                self.config.yAxis.ticksStyle = StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [2, 4])
                self.config.yAxis.minTicksSpacing = 50.0
                self.config.yAxis.formatter = { (value, decimals) in
                    return "\(value)"
                }
            }
        }
    }
    
    func randomEntries() -> [ChartDataEntry] {
        var entries = [ChartDataEntry]()
        for data in 0..<30 {
            let randomDouble = Double.random(in: 0...250)
            let newEntry = ChartDataEntry(x: "\(2000+data)", y: randomDouble)
            entries.append(newEntry)
        }
        return entries
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
