//
//  ProgressView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct ProgressView: View {
    
    @ObservedObject var viewModel = ProgressViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.intakePercentage)%")
                .font(.system(size: 36))
                .foregroundColor(Color(.lightGreen))
            Text("of \(viewModel.targetDailyIntake) ml Goal")
                .font(.system(size: 14))
            
            ZStack {
                Image(Images.emptyGlass.rawValue, bundle: Bundle.main)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 200)
                
                VStack {
                    Spacer()
                    Text("\(viewModel.dailyIntake) ml")
                        .padding()
                }
            }
            .frame(width: 200.0, height: 200)

            
            HStack(alignment: .center, spacing: 8) {
                Button("200 ml") {
                    viewModel.addedDailyIntake(200)
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)
                
                Button("400 ml") {
                    viewModel.addedDailyIntake(400)
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)

                Button("500 ml") {
                    viewModel.addedDailyIntake(500)
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
