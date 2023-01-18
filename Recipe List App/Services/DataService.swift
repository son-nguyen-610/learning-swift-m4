//
//  DataService.swift
//  Recipe List App
//
//  Created by Sơn Nguyễn on 1/16/23.
//

import Foundation

// Source of data
// Can just come here and check if data is invalid rather than going over the whole thing

class DataService {
    static func getLocalData() -> [Recipe] {
        // Parse local JSON file
        
        // Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") // name of file.json
        
        guard pathString != nil else {return [Recipe]()} // if pathString is empty, returns empty list
        
        // Create a URL object
        let url = URL(fileURLWithPath: pathString!) // "!" is to unwrap
        
        // Do-catch
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs for recipes
                for r in recipeData {
                    r.id = UUID()
                    
                    // IDs for ingredients in recipes
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipe
                return recipeData
            }
            catch {
                print(error) // Error with parsing JSON
            }
        }
        catch {
            print(error) // Error with getting data
        }
    return [Recipe]() // a return statement for if it gets down here (idk how)
    }
}
