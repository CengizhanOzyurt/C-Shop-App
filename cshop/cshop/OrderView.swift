//
//  OrderView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 4.12.2024.
//

import SwiftUI
struct OrderView: View {
    @ObservedObject var productManager = ProductManager.shared
    let columns: [GridItem] = [
        GridItem(.fixed(180)) // Sütunlar esnek genişlikte olacak
    ]    
    var body: some View {
        if productManager.OrderList.isEmpty{
            VStack{
                Image(systemName: "shippingbox")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
                Text("You haven't placed an order!")
                    .font(.headline)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
            }
        }
        else{
            VStack {
                VStack{
                    VStack{
                        Image("tick")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 120, height: 120)
                            .padding()
                        Text("Your order has been placed!")
                            .padding()
                            .bold()
                            .foregroundColor(.green)
                    }
                    .frame(maxWidth: .infinity,maxHeight: 200)
                    .overlay{
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.green)
                    }
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(productManager.OrderList,id: \.id){ product in
                                BasketCell(product: product)
                            }
                            .padding()
                        }
                    }
                    VStack{
                        Rectangle()
                            .frame(height : 2)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
                        HStack{
                            HStack{
                                Image(systemName: "truck.box")
                                    .resizable()
                                    .scaledToFit()
                                    .frame (width: 50,height: 50)
                                    .foregroundColor(.green)
                                Spacer()
                                    .frame(width: 30)
                                Image (systemName: "chevron.right.2")
                                    .foregroundColor(.gray)
                                Spacer()
                                    .frame(width: 30)
                                Image(systemName: "mappin.and.ellipse")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30).foregroundColor(.gray)
                                Spacer()
                                    .frame(width: 30)
                                Image(systemName: "chevron.right.2")
                                    .foregroundColor(.gray)
                                Spacer()
                                    .frame(width: 30)
                                Image(systemName: "house")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .offset(y: -10)
                    }
                    .frame(width: 500,height: 80)
                }
            }
            
            
        }
    }
}

#Preview{
    OrderView()
}
