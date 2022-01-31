//
//  ContainerView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @ObservedObject private var viewModel: ContainerViewModel
    
    init(container: Container) {
        viewModel = ContainerViewModel(container: container)
    }
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Spacer()
            Image(Images.backgroundImage.rawValue, bundle: Bundle.main)
                .resizable()
            Color.black.opacity(0.2)
            VStack {
                Text("Here you can specify your container size so it would be easier to enter your daily daily liquid intake.")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                TextField(
                    "",
                    text: $viewModel.containerSize
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
        .navigationBarTitle(viewModel.container.title)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(container: .container1)
    }
}
