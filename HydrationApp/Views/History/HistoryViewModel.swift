//
//  HistoryViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import Foundation
import BarChart

final class HistoryViewModel: ObservableObject {

    @Published var entries = [ChartDataEntry]()
    
}
