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
            Text("of \(viewModel.targetDailyIntake) \(viewModel.selectedUnit.shortTitle) Goal")
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
                Button("\(viewModel.container1Size) \(viewModel.selectedUnit.shortTitle)") {
                    viewModel.addedDailyIntake(viewModel.container1Size)
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)
                
                Button("\(viewModel.container2Size) \(viewModel.selectedUnit.shortTitle)") {
                    viewModel.addedDailyIntake(viewModel.container2Size)
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)

                Button("\(viewModel.container3Size) \(viewModel.selectedUnit.shortTitle)") {
                    viewModel.addedDailyIntake(viewModel.container3Size)
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
