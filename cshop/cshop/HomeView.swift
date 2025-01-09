//
//  HomeView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 28.11.2024.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
       
            TabView(){
                MainPage()
                    .tabItem{
                        HStack{
                            Image(systemName: "house.fill")
                            Text("Main Page")
                        }
                    }
                BasketView()
                    .tabItem{
                        HStack{
                            Image(systemName: "basket")
                                .foregroundColor(.orange)
                            Text("Basket")
                            
                        }
                        
                    }
                CategoryView()
                    .tabItem{
                        HStack{
                            Image(systemName: "list.bullet")
                            Text("Category")
                        }
                    }
                OrderView()
                    .tabItem{
                        HStack{
                            Image(systemName: "shippingbox")
                               
                            Text("Order")
                                .foregroundColor(.purple)
                        }
                    }
                AccountView()
                    .tabItem{
                        HStack{
                            Image(systemName: "person")
                            Text("Account")
                        }
                    }
            }.accentColor(.orange)
        }
}

#Preview {
    HomeView()
}
