//
//  AccountView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 4.12.2024.
//

import SwiftUI
import MapKit
import CoreLocation
struct IdentifiablePlace: Identifiable {
    let id = UUID()
    var location: CLLocationCoordinate2D
}
struct AccountView: View {
    let place = IdentifiablePlace(location: CLLocationCoordinate2D(latitude: 40.95900, longitude: 29.08348))
    @State var region : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.95900, longitude: 29.08348),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    )
    var body: some View {
        VStack{
            VStack{
                VStack{
                    HStack{
                        Image("admin 1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.trailing)
                        VStack(alignment: .leading){
                            Text("Name: ")
                                .foregroundColor(.orange)
                                .bold()
                            + Text("Cengizhan")
                                .font(.system(size: 15))
                            Text("Surname: ")
                                .foregroundColor(.orange)
                                .bold()
                            + Text("Ozyurt")
                                .font(.system(size: 15))
                            Text("Gender: ")
                                .foregroundColor(.orange)
                                .bold()
                            + Text("Male")
                                .font(.system(size: 15))
                            Text("Number: ")
                                .foregroundColor(.orange)
                                .bold()
                            + Text("+90524234")
                                .font(.system(size: 15))
                        }
                    }.padding()
                    Divider()
                        .frame(width: 300)
                        .background(.yellow)
                    HStack{
                        Text("Address: ")
                            .foregroundColor(.orange)
                            .bold()
                        + Text("Bagdat Street, Kadıkoy/Istanbul, 34710, Turkiye.")
                    }.padding([.top, .leading, .trailing])
                }
                .frame(width: 370, height: 300)
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.orange, lineWidth: 3)
                }
                .offset(y:-50)
                VStack{
                    ZStack{
                        Map(coordinateRegion: $region, annotationItems: [place]) { place in
                            MapPin(coordinate: place.location, tint: .red)
                           }
                           .clipShape(RoundedRectangle(cornerRadius: 20))
                           .frame(width: 370, height: 170)
                           .overlay {
                               RoundedRectangle(cornerRadius: 16)
                                   .stroke(.orange, lineWidth: 3)
                           }
                        VStack {
                            Text("My Location")
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .padding()
                                .frame(width:370 , height: 30)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .padding(.bottom,140)
                    }
                }
                .offset(y:-40)
                .padding()
            }
            .padding()
            VStack{
                Button(action:{
                }){
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.white)
                    Text("Change Options")
                        .bold()
                        .foregroundColor(.white)
                }.background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .frame(width: 250,height: 50)
                        .padding()
                )
                .offset(y:-30)
            }
        }
    }
}
#Preview {
    AccountView()
}
