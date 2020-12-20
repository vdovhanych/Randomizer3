//
//  ContentView.swift
//  Randomizer3
//
//  Created by Vitalij Dovhanyč on 08.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    // Zobrazení tabu na spodní liště
    var body: some View {
        
        TabView {
            RandomHeroView().tabItem { VStack{ Image ("heroTabIcon").padding()
                Text ("Heroes")}}
            MealView().tabItem {VStack{ Image("mealTabIcon")
                Text ("Meals")}}
        }
        
    }
}

// Meal View controller and implementation of api logic to view
struct MealView: View {
    
    @StateObject private var mealGenerator = MealGenerator()
    
    // Button for meal generator
    
    var actionButton: some View {
        Button ("Get Random Meal"){
            mealGenerator.fetchRandomMeal()
        }
        .foregroundColor(.white)
        .padding(.all, 20)
        .background(Color.blue)
        .cornerRadius(20)
        //  Option for the app to generate random meal on page appearing, deciden not to use.
        //        .onAppear{
        //            mealGenerator.fetchRandomMeal()
        //        }
    }
    
    var body: some View {
        
        //  THIS IS WHRE ALL Meal View UI is (imgae ui is in AsyncImageView)
        
        ScrollView {
            
            VStack{
                
                Spacer()
                
                actionButton
                if let name = mealGenerator.currentMeal?.name{
                    
                    Text(name)
                        .font(.largeTitle).padding()
                }
                
                AsyncImageView(urlString: $mealGenerator.currentImageURLString)
                
                if let ingredients = mealGenerator.currentMeal?.ingredients{
                    
                    HStack{
                        
                        Text("Ingredients")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 15)
                            .padding(.top, 15)
                            .offset(x:5)
                        
                        Spacer()
                    }
                    
                    ForEach(ingredients, id: \.self) {ingridient in
                        
                        HStack{
                            
                            Text (ingridient.name + " - " + ingridient.measure).offset(x: 15)
                            
                            Spacer()
                        }
                    }
                }
                
                if let instrucitons = mealGenerator.currentMeal?.instructions{
                    
                    Spacer()
                    
                    HStack{
                        Text ("Instructions")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 5)
                            .padding(.top, 15)
                            .offset(x:5)
                        
                        Spacer()
                    }
                    
                    Text (instrucitons)
                        .padding()
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
