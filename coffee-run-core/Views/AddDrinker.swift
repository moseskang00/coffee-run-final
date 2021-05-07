//
//  AddDrinker.swift
//  coffee-run-v2
//
//  Created by Moses Kang on 4/16/21.
//

// 05/01/2021 updated to accept coredata and form validation.

import SwiftUI

struct AddDrinker: View {

    let coreDM: CoreDataManager
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var AddVM = AddModel()
    
    @State var drinkName = ""
    @State var totalFat = ""
    @State var cholesterol = ""
    @State var sodium = ""
    @State var potassium = ""
    @State var carbs = ""
    @State var protien = ""
    @State var caffine = ""
    @State var calories = ""
    @State var cost = ""
    @State var errorMSG = ""
        
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    @State private var placeholder = "placeholder"

    var body: some View {
        VStack{
            Spacer()
// MARK: Form for information
            Form{
                Section(header:Text("Enter New Drink Name and Cost"), footer:Text(AddVM.topIsFilled ? "" :  AddVM.topMSG)
                            .foregroundColor(AddVM.topBool ? Color.green : Color.red)){
                    TextField("Drink Name", text: $AddVM.drinkName)
                    TextField("Cost of Drink", text: $AddVM.cost)
                }
                Section(header: Text("Add Nutritional Facts"),footer:Text(AddVM.isBottomFiled ? "" :  AddVM.bottomMSG)
                            .foregroundColor(AddVM.bottomBool ? Color.green : Color.red)){
                    TextField("Calories", text: $AddVM.calories)
                    TextField("Total Fat", text: $AddVM.totalFat)
                    TextField("Cholesterol", text: $AddVM.cholesterol)
                    TextField("Protein", text: $AddVM.protien)
                    TextField("Carbohydrates", text: $AddVM.carbs)
                    TextField("Sodium", text: $AddVM.sodium)
                    TextField("Potassium", text: $AddVM.potassium)
                    TextField("Caffeine", text: $AddVM.caffine)
                }
                Section(header: Text("Add an image")){
                    HStack{
                        Spacer()
                        VStack{
                            Image(uiImage: image ?? UIImage(named: placeholder)!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            Button("Add Image of Drink"){
                                self.showSheet = true
                            }
                            .padding(5)
                            .actionSheet(isPresented: $showSheet) {
                                ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                    .default(Text("Photo Library")) {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    },
                                    .default(Text("Camera")){
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    },
                                    .cancel()
                                ])
                            }
                        }
                        Spacer()
                    }
                    .sheet(isPresented: $showImagePicker, content: {
                        ImagePicker(isShown:self.$showImagePicker, image: self.$image, sourceType: self.sourceType)
                    })
                }
                
            }
            Button(action: {
                self.totalFat = "\(AddVM.totalFat) g"
                self.cholesterol = "\(AddVM.cholesterol) mg"
                self.protien = "\(AddVM.protien) g"
                self.carbs = "\(AddVM.carbs) g"
                self.sodium = "\(AddVM.sodium) mg"
                self.potassium = "\(AddVM.potassium) mg"
                self.caffine = "\(AddVM.caffine) mg"
                
                coreDM.saveOrder(drink: AddVM.drinkName, cost: Double(AddVM.cost) ?? 0.0, cal: AddVM.calories, carb: carbs, pro: protien, pot: potassium, sod: sodium, cho: cholesterol, fat: totalFat, caf: caffine, img: image ?? UIImage(named: "placeholder")!)
               print("fndjksnfjkd")
                self.presentation.wrappedValue.dismiss()
                
            }, label: {
                Text("Save")
                    .frame(width: 200, height:50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(5)
            })
            .opacity(AddVM.isFormComplete ? 1 : 0.5)
            .disabled(!AddVM.isFormComplete)
            Spacer()
            //temp delete this later

        }
        .navigationTitle("Add a New Drink")
    }
}

struct AddDrinker_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinker(coreDM: CoreDataManager())
    }
}
