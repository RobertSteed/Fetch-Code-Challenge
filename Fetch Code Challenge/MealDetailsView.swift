//
//  MealDetailsView.swift
//  Fetch Code Challenge
//
//  Created by Robert Steed on 9/14/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealDetailsView: View {
    
    
    var meal: Meal
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                ZStack {
                    WebImage(url: URL(string: meal.strMealThumb ?? "Loading..."))
                        .resizable()
                        .foregroundColor(.gray)
                        .redacted(reason: meal.strMealThumb == nil ? .placeholder : .init())
                        .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
                }
                    
                        HStack {
                            Text(meal.strMeal ?? "Loading...")
                                .font(.system(size: 29, weight: .bold))
                        }
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(30)
                        .offset(y: -30)
                    
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.system(size: 23, weight: .bold))
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                        ForEach(0..<10) { i in
                            if meal["strIngredient\(i)"] != nil && meal["strIngredient\(i)"] != "" {
                                VStack {
                                    HStack {
                                        Text(meal["strIngredient\(i)"] ?? "Loading...")
                                        
                                        Spacer()
                                                                                
                            Text(meal["strMeasure\(i)"] ?? "Loading...")
                                    .fontWeight(.bold)
                                        
                                    }
                                    .padding(.vertical)
                                    
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        
                    }
                    .background(Color.white)
               
            }
        })
        .navigationBarHidden(false)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(meal: Meal())
    }
}
                        
