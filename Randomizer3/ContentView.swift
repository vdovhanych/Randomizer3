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
            RandomHeroView().tabItem {VStack{ Image (systemName: "gamecontroller")
                Text ("Heroes")}}
            MealView().tabItem {VStack{ Image (systemName: "leaf.arrow.circlepath")
                Text ("Meals")}}
        }
        
    }
}

// Meal View controller and implementation of api logic to view
struct MealView: View {
    
    @StateObject private var mealGenerator = MealGenerator()
    
    // Button for meal generating
    
    var actionButton: some View {
        Button ("Get Random Meal"){
            mealGenerator.fetchRandomMeal()
        }
        .foregroundColor(.white)
        .padding(.all, 20)
        .background(Color.blue)
        .cornerRadius(20)
//        .onAppear{
//            mealGenerator.fetchRandomMeal()
//        }
    }
    
    var body: some View {
        
        // Comented background for testeing

        //        ZStack{
        //
        //            //Background MealView tab
        //
        //            Rectangle().foregroundColor(Color(red:200/255,green: 143/255, blue:32/255))
        //                .edgesIgnoringSafeArea(.all)
        //
        //            Rectangle().foregroundColor(Color(red:228/255, green: 195/255, blue: 76/255))
        //                .rotationEffect(Angle(degrees:58))
        //                .edgesIgnoringSafeArea(.all)
        
        // THIS IS WHRE ALL Meal View UI is (imgae ui is in AsyncImageView)
        ScrollView {
            
            VStack{
                
                actionButton
                if let name = mealGenerator.currentMeal?.name{
                    
                    Text(name)
                        .font(.largeTitle)
                }
                
                AsyncImageView(urlString: $mealGenerator.currentImageURLString)
                
                if let ingredients = mealGenerator.currentMeal?.ingredients{
                    HStack{
                        Text("Ingredients")
                            .font(.title2)
                            .padding(.all,15)
                        
                        Spacer()
                    }
                    
                    ForEach(ingredients, id: \.self) {ingridient in
                        
                        
                        
                        HStack{
                            Text (ingridient.name + " - " + ingridient.measure)
                            
                            
                            Spacer()
                        }
                    }
                }
                
                if let instrucitons = mealGenerator.currentMeal?.instructions{
                    
                    Spacer()
                    
                    HStack{
                        Text ("Instructions")
                            .font(.title2)
                            .padding(.all,15)
                        
                        Spacer()
                    }
                    
                    Text (instrucitons)
                        .padding()
                    
                }
                
            }.padding()
        }
    }
    
}
//} - zstack ending bracket

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
