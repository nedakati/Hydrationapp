//
//  BarChartGrid.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct ChartGrid: Shape {
    
    let divisions: Int
      
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let stepSize = rect.height / CGFloat(divisions)
        
        (0 ... divisions).forEach { step in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY - stepSize * CGFloat(step)))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - stepSize * CGFloat(step)))
        }
        
        return path
    }
}
