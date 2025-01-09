//
//  ProductCell.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 8.12.2024.
//
import SwiftUI
var totalPrice: Int = 0
struct ProductCell: View {
    @State var product : Products
    func addProductToList(product: Products) {
        if !ProductManager.shared.productList.contains(where: { $0.id == product.id }) {
            ProductManager.shared.productList.append(product)
        }
    }
    func calcTotalPrice() {
        if ProductManager.shared.productList.contains(where: { $0.id == product.id }) {
            ProductManager.shared.totalPrice += product.price
        }
    }
    var body: some View {
        VStack{
            VStack{
                Button{
                }label: {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                        .background(
                            Circle()
                                .stroke(.gray,lineWidth: 1)
                                .frame(width: 30,height: 30)
                        )
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                }
            }
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 160)
            Spacer()
            Text(product.name)
                .bold()
                .foregroundColor(.primary)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            Text(product.info)
                .font(Font.system(size: 15))
                .foregroundColor(.secondary)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            HStack{
                Text("4.5")
                    .font(Font.system(size: 13))
                ForEach(0..<4){ _ in
                Image(systemName: "star.fill")
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
                    .frame(minWidth: 0,maxWidth: 13,alignment: .leading)
                }
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(.yellow)
            }.padding([.top, .bottom, .trailing], 4.0)
            HStack{
                Text("\(product.price)$")
                    .bold()
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(hue: 0.051, saturation: 0.993, brightness: 0.924))
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                Button{
                    addProductToList(product: product)
                    calcTotalPrice()
                }label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.green)
                        .frame(width: 30,height: 30)
                }
            }
        }
        .padding(15)
        .frame(width: 180,height: 330)
        .overlay{
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray,lineWidth: 1)
        }
    }
}
