//
//  NetworkingClient.swift
//  project1-foodrecipes
//
//  Created by Tomas Mateo Perotti on 15/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import Foundation
import Alamofire
import Lottie

class FoodRequest {

    static func getHeaders() -> HTTPHeaders {
        let xRapidAPIHost = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        let xRapidAPIKey = "ca51154f42msh437bef38f338201p172ce5jsn92cd7284bb9e"
        let headers: HTTPHeaders = [
            "X-RapidAPI-Host": xRapidAPIHost,
            "X-RapidAPI-Key": xRapidAPIKey,
            ]
        return headers
    }
    
    static func getParameters(request: String) -> Parameters {
        return ["q": request]
    }
  
    
}

class FoodService {
    let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/quickAnswer")
    
    func getFoodAnswer(question: String, completion: @escaping (NutritionAnswer?) -> Void){
        
        var nutritionAnswer: NutritionAnswer?
        
        Alamofire.request(url!,
                          method: .get,
                          parameters: FoodRequest.getParameters(request: question),
                          encoding: URLEncoding.default,
                          headers: FoodRequest.getHeaders()).responseJSON { response in
                            
                            switch response.result {
                            case .success(_):
                                guard let data = response.data else {
                                    return
                                }
                                let decoder = JSONDecoder()
                                do {
                                    nutritionAnswer = try decoder.decode(NutritionAnswer.self, from: data)
                                    completion(nutritionAnswer ?? nil)
                                } catch {
                                    
                                }
                            default:
                                print("")
                            }
            
        }
    }
}

