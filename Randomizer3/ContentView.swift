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
            HeroView().tabItem {VStack{ Image (systemName: "gamecontroller")
                Text ("Heroes")}}
            MealView().tabItem {VStack{ Image (systemName: "leaf.arrow.circlepath")
                Text ("Meals")}}
        }
        
    }
}

// Zobrazení jednotlivých tabu


// 1 TAB Hero view, and hero random generator logic
struct HeroView: View {
    @State private var selection = 0
    @State private var randomNumber = [0]
    @State private var randomHero = ["hero1","hero2","hero3","hero4","hero5","hero6","hero7","hero8","hero9","hero10","hero11","hero12","hero13","hero14","hero15","hero16","hero17","hero18","hero19","hero20","hero21","hero22","hero23","hero24","hero25","hero26","hero27","hero28","hero29","hero30","hero31","hero32","hero33","hero34","hero35","hero36","hero37","hero38","hero39","hero40","hero41","hero42","hero43","hero44","hero45","hero46","hero47","hero48","hero49","hero50","hero51","hero52","hero53","hero54","hero55","hero56","hero57","hero58","hero59","hero60","hero61","hero62","hero63","hero64","hero65","hero66","hero67","hero68","hero69","hero70","hero71","hero72","hero73","hero74","hero75","hero76","hero77","hero78","hero79","hero80","hero81","hero82","hero83","hero84","hero85","hero86","hero87","hero88","hero89","hero90","hero91","hero92","hero93","hero94","hero95","hero96","hero97","hero98","hero99","hero100","hero101","hero102","hero103","hero104","hero105","hero106","hero107","hero108","hero109","hero110","hero111","hero112","hero113","hero114","hero115","hero116","hero117","hero118","hero119"]
    
    
    var body: some View {
        
        // Comented background for testeing
        
        //        ZStack{
        //            //Background 2nd tab
        //
        //            Rectangle().foregroundColor(Color(red:200/255,green: 143/255, blue:32/255))
        //                .edgesIgnoringSafeArea(.all)
        //
        //            Rectangle().foregroundColor(Color(red:228/255, green: 195/255, blue: 76/255))
        //                .rotationEffect(Angle(degrees:58))
        //                .edgesIgnoringSafeArea(.all)
        
        
        VStack{
            
            Spacer()
            
            HStack{
                
                
                
                Text ("Dota2 Heroes")
                    .bold()
                
            }.scaleEffect(2)
            
            
            Spacer()
            
            
            //Hero name 1st tab
            
            Text("HERO NAME")
                .foregroundColor(.black)
                .padding(.all,10)
                .background(Color.white.opacity(0.6))
                .cornerRadius(20)
            
            Spacer()
            
            
            HStack{
                
                Spacer()
                
                Image(randomHero[randomNumber[0]])
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                
                Spacer()
                
            }
            
            Spacer()
            
            //Button 1st tab
            
            Button(action: {
                
                self.randomNumber [0] = Int.random(in: 1...self.randomHero.count)
                
            }) { Text ("Generate Random Hero")
                .bold()
                .foregroundColor(.white)
                .padding(.all, 20)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(1)
            }
            
            Spacer()
            
        }
    }
}
//} - zstack ending bracket

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
        .onAppear{
            mealGenerator.fetchRandomMeal()
        }
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
