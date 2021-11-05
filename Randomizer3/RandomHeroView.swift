//
//  RandomHeroView.swift
//  Randomizer3
//
//  Created by Vitalij Dovhanyč on 09.12.2020.
//

import SwiftUI

struct RandomHeroView: View {
    @State var randomHeroImage: String = ""
    
    var images = ["hero1","hero2","hero3","hero4","hero5","hero6","hero7","hero8","hero9","hero10","hero11","hero12","hero13","hero14","hero15","hero16","hero17","hero18","hero19","hero20","hero21","hero22","hero23","hero24","hero25","hero26","hero27","hero28","hero29","hero30","hero31","hero32","hero33","hero34","hero35","hero36","hero37","hero38","hero39","hero40","hero41","hero42","hero43","hero44","hero45","hero46","hero47","hero48","hero49","hero50","hero51","hero52","hero53","hero54","hero55","hero56","hero57","hero58","hero59","hero60","hero61","hero62","hero63","hero64","hero65","hero66","hero67","hero68","hero69","hero70","hero71","hero72","hero73","hero74","hero75","hero76","hero77","hero78","hero79","hero80","hero81","hero82","hero83","hero84","hero85","hero86","hero87","hero88","hero89","hero90","hero91","hero92","hero93","hero94","hero95","hero96","hero97","hero98","hero99","hero100","hero101","hero102","hero103","hero104","hero105","hero106","hero107","hero108","hero109","hero110","hero111","hero112","hero113","hero114","hero115","hero116","hero117","hero118","hero119","hero120","hero121","hero122"]
    
    func chooseRandomImage() -> String {
        let array = images
        
        let result = array.randomElement()!
        
        return result
    }
    
    var body: some View {
        
        // Comented background for testing
        
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
            
            
//  Todo section as to showing hero name coresponding with the image.
            
            //            Text("HERO NAME")
            //                .foregroundColor(.black)
            //                .padding(.all,10)
            //                .background(Color.white.opacity(0.6))
            //                .cornerRadius(20)
            //
            //            Spacer()
            
            
            HStack{
                
                Spacer()
                
                Image(randomHeroImage)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
            }
            
            Spacer()
            
            //Button 1st tab
            
            Button(action: {
                
                self.randomHeroImage = chooseRandomImage()
                
            }) { Text ("Get Random Hero")
                .bold()
                .foregroundColor(.white)
                .padding(.all, 20)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(1)
                .onAppear(){
                    self.randomHeroImage = chooseRandomImage()
                }
            }
            
            Spacer()
            
        }
    }
}

struct RandomHeroView_Previews: PreviewProvider {
    static var previews: some View {
        RandomHeroView()
    }
}
