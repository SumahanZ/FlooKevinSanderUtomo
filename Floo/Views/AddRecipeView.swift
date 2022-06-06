//
//  AddRecipeView.swift
//  Floo
//
//  Created by MacBook Pro on 08/05/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var nationality:String = ""
    @State private var calories:String = ""
    @State private var carbo:String = ""
    @State private var protein:String = ""
    @State private var fat:String = ""
    @State private var amountIngredients: [String] = [""]
    @State private var nameIngredients: [String] = [""]
    @State private var unitIngredients: [String] = [""]
    @State private var steps: [String] = [""]
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
    ScrollView {
        VStack {
        Text("Add Recipe")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding([.top, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
        
            VStack {
                VStack {
                    Text("General")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                TextField("Name", text: $name)
                        .padding(.horizontal, 30).padding(.trailing, 20)
                Divider()
                 .padding(.horizontal, 30)
                
                TextField("Description", text: $description)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    
                Divider()
                 .padding(.horizontal, 30)
                
//                TextField("Nationality / Origin", text: $nationality)
//                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
//                Divider()
//                 .padding(.horizontal, 30)
                
                }
                .padding(.top)
                
                
                VStack {
                    Text("Nutritions")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Calories (Kcal)", text: $calories)
                        .padding(.horizontal, 30)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Carbohydrates (Gram)", text: $carbo)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    
                    TextField("Protein (Gram)", text: $protein)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                    TextField("Fat (Gram)", text: $fat)
                        .padding(.horizontal, 30).padding([.top, .trailing], 20)
                    Divider()
                     .padding(.horizontal, 30)
                }
                .padding(.vertical)
                
                
                
                VStack {
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(0..<amountIngredients.count, id: \.self) {i in
                    HStack {
                        TextField("Ingredient \(i+1)", text: $nameIngredients[i])
                            .padding(.leading, 20.0)
                        VStack {
                        TextField("Amount", text: $amountIngredients[i])
                           .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                        TextField("Unit", text: $unitIngredients[i])
                           .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                                
                        }
                    }
                    .padding(.horizontal, 30).padding(.trailing, 20)
                }
                    Button{
                        unitIngredients.append("")
                        amountIngredients.append("")
                        nameIngredients.append("")
                    }label : {
                        Text("Add More Ingredients")
                    }
                    .padding(.all, 15.0)
                    .frame(maxWidth: 240, alignment: .center)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.all, 15.0)
                    
                    Text("Steps")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading, 25.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<steps.count, id: \.self) {i in
                    HStack {
                        TextField("Step \(i+1)", text: $steps[i])
                            .padding(.leading, 20.0)
                        }
                    }
                    .padding(.horizontal, 30).padding(.trailing, 20)
                }
                    Button{
                        steps.append("")
                    }label : {
                        Text("Add More Steps")
                    }
                    .padding(.all, 15.0)
                    .frame(maxWidth: 240, alignment: .center)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .padding(.all, 15.0)
                    
                    
                        Button(){
                            var myRecipes: [Recipe] = [Recipe]()
                            var recipe:Recipe = Recipe()
                            recipe.title = name
                            recipe.summary = description
                            recipe.nutrition = Nutrition()
                            recipe.extendedIngredients = [ExtendedIngredient]()
                            recipe.nutrition?.nutrients = [Flavonoid](repeating: Flavonoid(), count: 22)
                            recipe.analyzedInstructions = [AnalyzedInstruction](repeating: AnalyzedInstruction(), count: 1)
                            recipe.analyzedInstructions?[0].steps = [Step]()
                            recipe.nutrition?.nutrients?[0].amount = Double(calories)
                            recipe.nutrition?.nutrients?[3].amount = Double(carbo)
                            recipe.nutrition?.nutrients?[8].amount = Double(protein)
                            recipe.nutrition?.nutrients?[1].amount = Double(fat)
                            for (i,ingredient) in nameIngredients.enumerated() {
                             var ingredientTemp = ExtendedIngredient()
                                ingredientTemp.name = ingredient
                                ingredientTemp.unit = unitIngredients[i]
                                ingredientTemp.amount = Double(amountIngredients[i])
                                recipe.extendedIngredients?.append(ingredientTemp)
                            }
                            
                            for step in steps {
                             var temp = Step()
                                temp.step = step
                                recipe.analyzedInstructions?[0].steps?.append(temp)
                            }
                            let decoder = JSONDecoder()
                            if let data = UserDefaults.standard.value(forKey: "myRecipe") as? Data {
                                        let taskData = try? decoder.decode([Recipe].self, from: data)
                                        myRecipes = taskData ?? []
                                    } else {
                                        myRecipes = []
                                    }
                            var temp = recipe
                            let id = myRecipes.last?.id ?? 1234567889
                            temp.id = id + 1
                            myRecipes.append(temp)
                            print(temp)
                            let encoder = JSONEncoder()
                            if let encoded = try? encoder.encode(myRecipes) {
                                UserDefaults.standard.set(encoded, forKey: "myRecipe")
                         }
                            presentation.wrappedValue.dismiss()
                        }label : {
                            Text("Submit Recipe")
                        }
                        .padding(.all, 15.0)
                        .frame(maxWidth: 240, alignment: .center)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding(.all, 15.0)
                    
                }
                
            }
        }
            
        }
    }


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
