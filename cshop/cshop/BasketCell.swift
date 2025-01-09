import SwiftUI

struct BasketCell: View {
    var product: Products
    
    var body: some View {
        VStack {
            HStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 160)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.primary)
                    
                    Text(product.info)
                        .font(.system(size: 17))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("$\(product.price)")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color(hue: 0.051, saturation: 0.993, brightness: 0.924))
                }
                .padding(.leading)
            }
        }
        .padding(15)
        .frame(width: 360, height: 150)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
        }
    }
}

#Preview {
    BasketCell(product : FeaturedList[0])
}
