//
//  SelectionLine.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct SelectionLine: View {
    let location: CGPoint?
    let height: CGFloat
    let color = Color(red: 100/255, green: 100/255, blue: 100/255)

    var body: some View {
        Group {
            if location != nil {
                self.centreLine()
                    .stroke(lineWidth: 2)
                    .offset(x: self.location!.x)
                    .foregroundColor(self.color)
                    /* '.id(UUID())' will prevent view from slide animation.
                        Because this view is a child view and passed to 'BarChartView' parent, parent might already has animation.
                        So, If you want to disable it, just call '.animation(nil)' instead of '.id(UUID())' */
                    .id(UUID())
            }
        }
    }

    func centreLine() -> Path {
        var path = Path()
        let p1 = CGPoint(x: 0, y: 0)
        let p2 = CGPoint(x: 0, y: self.height)
        path.move(to: p1)
        path.addLine(to: p2)
        return path
    }
}
