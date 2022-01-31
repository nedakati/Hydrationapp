//
//  ProgressView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI
import CoreData

struct ProgressView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject private var viewModel = ProgressViewModel()

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
                    viewModel.addDailyIntake(viewModel.container1Size)
                    saveIntake()
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)
                
                Button("\(viewModel.container2Size) \(viewModel.selectedUnit.shortTitle)") {
                    viewModel.addDailyIntake(viewModel.container2Size)
                    saveIntake()
                }
                .buttonStyle(AccentButtonStyle())
                .frame(height: 30)

                Button("\(viewModel.container3Size) \(viewModel.selectedUnit.shortTitle)") {
                    viewModel.addDailyIntake(viewModel.container3Size)
                    saveIntake()
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
    
    private func saveIntake() {
        let fetchRequest: NSFetchRequest<DailyIntakeEntity> = DailyIntakeEntity.fetchRequest()

        viewContext.perform {
            do {
                let results = try fetchRequest.execute()

                if results.isEmpty {
                    saveItem()
                } else {
                    var didSaveItem = false
                    for result in results {
                        if result.date == viewModel.previusDate && viewModel.previusDate.isDateToday {
                            viewContext.delete(result)
                            saveItem()
                            didSaveItem = true
                        }
                    }
                    
                    if !didSaveItem {
                        saveItem()
                    }
                }
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    
    private func saveItem() {
        let newItem = DailyIntakeEntity(context: viewContext)
        newItem.date = viewModel.lastChangeDate
        newItem.intake = Int64(viewModel.dailyIntake)
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
