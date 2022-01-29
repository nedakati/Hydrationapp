//
//  SettingsView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    var body: some View {
        List {
            Section(header: Text("")) {
                NavigationLink {
                    UnitsView()
                } label: {
                    SettingsCell(title: "Units", secondaryTitle: viewModel.selectedUnit.title)
                }
                NavigationLink {
                   DailyGoalView()
                } label: {
                    SettingsCell(title: "Daily Goal", secondaryTitle: viewModel.targetDailyIntake)
                }
            }
    
            Section(header:
                Text("Containers")
                        .foregroundColor(Color(.lightGray))
                        .font(.callout)
            ) {
                NavigationLink {
                    
                } label: {
                    SettingsCell(title: "Container 1", secondaryTitle: "")
                }
                NavigationLink {
                    
                } label: {
                    SettingsCell(title: "Container 2", secondaryTitle: "")
                }
                NavigationLink {
                    
                } label: {
                    SettingsCell(title: "Container 3", secondaryTitle: "")
                }
            }
            Text("These containers will appear on your main screen so you can easily tap on them and track your intake.")
                .font(.callout)
                .foregroundColor(Color(.lightGray))
                .listRowBackground(Color(.backgroundColor))
        }
        .preferredColorScheme(.dark)
        .navigationBarTitle("Settings", displayMode: .inline)
        .onAppear {
            viewModel.reloadData()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
