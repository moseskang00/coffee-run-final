//
//  AddModel.swift
//  coffee-run-core
//
//  Created by Moses Kang on 5/1/21.
//  This is the viewModel file for form validation used in AddDrinker.swift

import Foundation

class AddModel: ObservableObject{
    @Published var drinkName = ""
    @Published var totalFat = ""
    @Published var cholesterol = ""
    @Published var sodium = ""
    @Published var potassium = ""
    @Published var carbs = ""
    @Published var protien = ""
    @Published var caffine = ""
    @Published var calories = ""
    @Published var cost = ""
    
    //MARK: Validation functions
    func drinkNameString() -> Bool {
        return drinkName != ""
    }
    func totalFatValidation() -> Bool {
        let tf = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return tf.evaluate(with: totalFat)
    }
    func cholesterolVal() -> Bool {
        let chol = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return chol.evaluate(with: cholesterol)
    }
    func sodiumVal() -> Bool {
        let sod = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return sod.evaluate(with: sodium)
    }
    func potVal() -> Bool {
        let pot = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return pot.evaluate(with: potassium)
    }
    func carbVal() -> Bool {
        let cval = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return cval.evaluate(with: carbs)
    }
    func proVal() -> Bool {
        let pro = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return pro.evaluate(with: protien)
    }
    func caffVal() -> Bool {
        let caff = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return caff.evaluate(with: caffine)
    }
    func calVal() -> Bool {
        let calVal = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return calVal.evaluate(with: calories)
    }
    func costVal() -> Bool {
        let cV = NSPredicate(format: "SELF MATCHES %@", "^(?:[1-9]\\d*)(?:\\.\\d*)?$")
        return cV.evaluate(with: cost)
    }
    
    var topIsFilled: Bool {
        if drinkName == "" && cost == "" {
            return true }
        else {
            return false }
    }
    
    var isBottomFiled: Bool {
        if totalFat == "" && calories == "" && caffine == ""
        && protien == "" && carbs == "" && potassium == "" &&
            sodium == "" && cholesterol == ""{
            return true
        }
        else {
            return false }
     }
    
    var isFormComplete: Bool {
        if !drinkNameString() || !totalFatValidation() || !cholesterolVal() ||
            !sodiumVal() || !potVal() || !carbVal() || !proVal()
            || !caffVal() || !calVal() || !costVal() {
            return false
        }
        return true
    }
    
    var topMSG: String {
        if drinkNameString() && costVal(){
            return "Confirmed Drink Name and Cost Information"
        }
        else if !drinkNameString() || !costVal() && drinkName != "" && cost != "" {
            return "Please enter correct values for Drink name and Cost"
        }
        else {return ""}
    }
    
    var topBool: Bool {
        if drinkNameString() && costVal(){
            return true
        }
        else {
            return false
        }
    }
    
    var bottomMSG: String {
        if totalFatValidation() && calVal() && caffVal() && proVal()
            && carbVal() && potVal() && sodiumVal() && cholesterolVal() {
            return "Confirmed Nutrition Information"
        }
        else if totalFat != "" && calories != "" && caffine != ""
                    && protien != "" && carbs != "" && potassium != "" &&
                        sodium != "" && cholesterol != "" && (!totalFatValidation() || !cholesterolVal() ||
        !sodiumVal() || !potVal() || !carbVal() || !proVal()
        || !caffVal() || !calVal()){
            print(totalFat)
            print(calories)
            print(caffine)
            print(protien)
            print(carbs)
            print(potassium)
            print(sodium)
            print(cholesterol)
            return "Please enter correct values for nutritional facts" }
        else {return ""}
    }
    
    var bottomBool: Bool {
        if totalFatValidation() && calVal() && caffVal() && proVal()
            && carbVal() && potVal() && sodiumVal() && cholesterolVal(){
            return true
        }
        else {
            return false
        }
    }
}
