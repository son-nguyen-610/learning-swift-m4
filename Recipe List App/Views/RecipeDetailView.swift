//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Sơn Nguyễn on 1/16/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5.0)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("- "+item)
                            .padding(.bottom, 2.0)
                        
                    }
                }.padding(.horizontal, 15.0)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Direction")
                        .font(.headline)
                        .padding([.bottom, .top], 5.0)
                    ForEach(0..<recipe.directions.count, id: \.self) {
                        i in
                        Text(String(i+1) + ". " + recipe.directions[i])
                            .padding(.bottom, 5.0)
                        
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create dummy recipe to pass and see preview cuz actual recipe not ready
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
