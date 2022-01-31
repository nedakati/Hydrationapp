//
//  DailyGoalView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(30)
    }
}

struct DailyGoalView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject private var viewModel = DailyGoalViewModel()

    var body: some View {
        ZStack {
            Spacer()
            Image(Images.backgroundImage.rawValue, bundle: Bundle.main)
                .resizable()
            Color.black.opacity(0.2)
            VStack {
                Text("Here you can set your hydration goal based on your preferred unit of measurement")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                TextField(
                    "",
                    text: $viewModel.targetDailyIntake
                )
                .textFieldStyle(MyTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.lightGreen), lineWidth: 4))
                .frame(width: 250, height: 50, alignment: .center)
                Text(viewModel.selectedUnit.title)
                    .font(.title)
                    .padding([.top])
                Spacer()
            }
        }
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
                .foregroundColor(Color(.lightGreen))
        }), trailing: Button(action: {
            viewModel.save()
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .foregroundColor(Color(.lightGreen))
        }))
        .navigationBarTitle("Daily Goal")
        .navigationBarBackButtonHidden(true)
    }
}

struct DailyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalView()
    }
}
