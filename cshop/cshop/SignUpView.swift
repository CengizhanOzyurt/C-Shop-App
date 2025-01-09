//
//  SwiftUIView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 28.11.2024.
//

import SwiftUI
struct SignUpView: View {
    @StateObject private var viewModel = SignInViewModel()
    @State private var SignNavigate = false
    @State private var LoginNavigate = false
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var surname = ""
    var body: some View {
        VStack {
            Image("E-TİCARET LOGO")
                .resizable()
                .scaledToFit()
                .offset(y:90)
                .frame(width: 300, height: 500)
            VStack{
                VStack{
                    Text("WELCOME!")
                        .font(.title)
                        .fontWeight(.bold)
                        .autocapitalization(.none)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(.orange)
                        .padding()
                        .frame(height: 6)
                        .offset(y : -20)
                    
                    TextField("E-mail", text: $viewModel.email)
                        .autocapitalization(.none)
                        .textInputAutocapitalization(.never)
                    Divider()
                        .frame(width: 320)
                        .background(.orange)
                        .padding(.trailing)
                        
                    SecureTextField( text: $viewModel.password)
                    Divider()
                        .frame(width: 320)
                        .background(.orange)
                        .padding(.trailing)
                    
                    Button(action: {
                        viewModel.signIn()
                    }) {
                        Text("Register")
                            .frame(width: 170)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(Color(hue: 0.092, saturation: 1.0, brightness: 0.973))
                            .cornerRadius(10)
                            .offset(y:10)
                    }
                    .padding()
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Text("Already have an account? ")
                            .bold()
                        Button(action:{
                            LoginNavigate = true
                        }){
                            Text("Sign in")
                        }
                        .navigationDestination(isPresented: $LoginNavigate){
                            LoginView()
                        }
                    }
                    .padding()
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray,lineWidth: 1)
                        .frame(width: 350, height: 340)
                        .offset(y:0)
                }
            }
        }
        .padding()
        .background(.white)
        .padding(.horizontal,20)
        .offset(y: -200)
    }
}

#Preview {
    SignUpView()
}
