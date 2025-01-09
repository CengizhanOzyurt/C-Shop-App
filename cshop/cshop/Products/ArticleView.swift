//
//  ArticleView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 18.12.2024.
//

import SwiftUI

struct ArticleView: View {
    
    @State private var searchText: String = ""
    @State private var FavNavigate = false
    let columns: [GridItem] = [
        GridItem(.fixed(180)), // Sütunlar esnek genişlikte olacak
        GridItem(.fixed(180))
        ]

    var body: some View {
        VStack{
            HStack{
                HStack {
                               Image(systemName: "magnifyingglass")
                                    .foregroundColor(.orange)
                                    .padding(.leading, 15)
                               TextField("Search", text: $searchText)
                                   .padding(10)
                                   .autocapitalization(.none)
                           }
                           .background(Color(.systemGray6))
                           .cornerRadius(8)
                           .overlay(
                               RoundedRectangle(cornerRadius: 8)
                                   .stroke(Color.orange, lineWidth: 2)
                           )
                           .padding(.leading, 10)
                    NavigationStack{
                        Button(action:{
                            FavNavigate = true
                        })
                        {
                            Image(systemName: "heart.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .shadow(radius: 2)
                                .accentColor(.orange)
                        }
                    }
                    .navigationDestination(isPresented: $FavNavigate){
                        FavoritesView()
                    }
                    .padding()
            }

            .frame(height: 60)
                    .background(Color.white)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
            VStack{
                ScrollView{
                    Image("ARTICLES")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .shadow(color: .orange, radius: 5, x: 0, y: 5)
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(ArticleList,id: \.id){ product in
                            ProductCell(product: product)
                        }
                    }
                    .padding()
                       
                }
            }
        }
    }
}
#Preview {
    ArticleView()
}
