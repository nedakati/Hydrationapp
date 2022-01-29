//
//  ProgressView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        VStack {
            Text("0%")
                .font(.system(size: 36))
                .foregroundColor(Color(.lightGreen))
            Text("of 2000 ml Goal")
                .font(.system(size: 14))
            
            Image(Images.emptyGlass.rawValue, bundle: Bundle.main)
                .resizable()
                .scaledToFit()
                .frame(width: 200.0, height: 200)
            HStack(alignment: .center, spacing: 8) {
                Button("200 ml") {
                    
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)
                
                Button("400 ml") {
                    
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)

                Button("500 ml") {
                    
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)
            }
            .padding()
            Text("Happy you're back to track your healthy habit of staying hydrated.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading])
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
