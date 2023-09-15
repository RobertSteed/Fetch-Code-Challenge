//
//  NewAPICall.swift
//  Fetch Code Challenge
//
//  Created by Robert Steed on 9/14/23.
//

import Foundation
import Foundation
import SwiftUI

class NewRecipesViewModel: ObservableObject {
    
    @Published var meals: [Meal]?
    public var placeholders = Array(repeating: Meal(), count: 10)
    
    func fetchData() {
        let urlString = "\(Constants.baseURl)"
        
//        /search.php?f=b
//
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error listing recipes")
                return
            }
            
            if let data = data {
                do {
                    let search = try JSONDecoder().decode(Search.self, from: data)
                    DispatchQueue.main.async {
                        self.meals = search.meals
                    }
                } catch {
                    print("Error parsing data")
                    return
                }
            }
        }.resume()
    }
}
