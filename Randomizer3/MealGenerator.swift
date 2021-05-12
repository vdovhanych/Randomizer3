//
//  MealGenerator.swift
//  Randomizer3
//
//  Created by Vitalij Dovhanyč on 08.12.2020.
//

import Foundation
import Combine

final class MealGenerator: ObservableObject {
    
    @Published var currentMeal: Meal?
    @Published var currentImageURLString: String?
    private var cancellable: AnyCancellable?
    
    func fetchRandomMeal() {
        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
            .receive(on: DispatchQueue.main)
            .sink { _ in }
                
                receiveValue: { data, _ in 
                    if let mealData = try? JSONDecoder().decode(MealData.self,from: data){
                        self.currentMeal = mealData.meals.first
                        self.currentImageURLString = mealData.meals.first?.imageUrlString
                    }
                }
    }
}

