//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Sơn Nguyễn on 1/15/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        // let service = DataService()
        self.recipes = DataService.getLocalData() // Use DataService instade of DataService() because of "static" in DataService's func. Basically uses class instead of instances of class.
    }
}
