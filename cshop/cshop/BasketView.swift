import SwiftUI
struct BasketView: View {
    @ObservedObject var productManager = ProductManager.shared
    let columns: [GridItem] = [
        GridItem(.fixed(180))
        ]
    
    var body: some View {
        
        if productManager.productList.isEmpty{
            VStack{
                Image(systemName: "basket")
                    .resizable()
                    .frame(width: 80, height: 80)
                    
                    .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
                Text("Basket is Empty")
                    .font(.headline)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
            }
        }
        else{
            VStack {
                VStack{
                    ScrollView{
                        
                        LazyVGrid(columns: columns, spacing: 20){
                            
                            ForEach(productManager.productList,id: \.id){ product in
                                BasketCell(product: product)
                            }
                        }
                        .padding()
                    }
                }
                VStack{
                    Rectangle()
                        .frame(height : 2)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.059, brightness: 0.862))
                    HStack{
                        
                        VStack{
                            Text("Total Price:")
                                .bold()
                                
                            Text("$\(ProductManager.shared.totalPrice)")
                                .bold()
                                .foregroundColor(.orange)
                                .font(.system(size: 25))
                        }
                        Spacer()
                            .frame(width: 50)
                        Button(action: {
                            productManager.productList.forEach{ product in
                                if !productManager.OrderList.contains(where : { $0.id == product.id}){
                                    productManager.OrderList.append(product)
                                }
                            }
                        }) {
                            Text("Buy")
                                .frame(width: 120)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(.green))
                                .cornerRadius(10)
                                .bold()
                                .font(.system(.title2))
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


#Preview{
    BasketView()
}
