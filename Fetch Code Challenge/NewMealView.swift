//
//  NewMealView.swift
//  Fetch Code Challenge
//
//  Created by Robert Steed on 9/14/23.
//

import SwiftUI
import SDWebImageSwiftUI

@MainActor
struct NewMealView: View {
    
    @ObservedObject private var viewModel = NewRecipesViewModel()
    var meal: Meal
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    VStack {
                        ForEach(viewModel.meals ?? viewModel.placeholders, id: \.idMeal) { meal in
                            NavigationLink(
                                destination: MealDetailsView(meal: meal),
                                label: {
                                    NewRecipeView(meal: meal)
                                })
                        }
                    }
                }
            }
            .padding(.horizontal)
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct NewRecipeView: View {
    var meal: Meal

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(meal.strMeal ?? "Loading...")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .redacted(reason: meal.strMeal == nil ? .placeholder : .init())

                ZStack(alignment: .topTrailing) {
                    WebImage(url: URL(string: meal.strMealThumb ?? "Loading..."))
                        .resizable()
                        .foregroundColor(.gray)
                        .redacted(reason: meal.strMealThumb == nil ? .placeholder : .init())
                        .frame(width: 100, height: 100)

                }

            }

        }

    }

}

struct NewRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        NewMealView(meal: Meal())
    }
}
