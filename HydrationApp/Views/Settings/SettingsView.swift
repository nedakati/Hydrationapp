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
                    ContainerView(container: .container1)
                } label: {
                    SettingsCell(title: Container.container1.title, secondaryTitle: viewModel.container1)
                }
                NavigationLink {
                    ContainerView(container: .container2)
                } label: {
                    SettingsCell(title: Container.container2.title, secondaryTitle: viewModel.container2)
                }
                NavigationLink {
                    ContainerView(container: .container3)
                } label: {
                    SettingsCell(title: Container.container3.title, secondaryTitle: viewModel.container3)
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
