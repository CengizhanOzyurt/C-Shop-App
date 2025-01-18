//
//  LoginPage.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 28.11.2024.
//

import SwiftUI
import FirebaseAuth
@MainActor
final class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginError: String? = nil
    @Published var registrationError: String? = nil
    @Published var isLoggedIn: Bool = false 
    @Published var isRegistered: Bool = false
    
    func signIn() {
        guard !email.isEmpty,!password.isEmpty else {
            print( "Email or password is empty!")
            return
        }
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            }
            catch{
                print("Error: \(error)")
            }
        }
    }
    func signLogin() {
            guard !email.isEmpty, !password.isEmpty else {
                loginError = "Email or password is empty!"
                return
            }

            Task {
                do {
                    let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
                    print("Login successful! User: \(authResult.user.email ?? "No Email")")
                    isLoggedIn = true // Giriş başarılı
                    
                    
                } catch {
                    print("Login error: \(error.localizedDescription)")
                    loginError = "Login failed: \(error.localizedDescription)"
                    isLoggedIn = false
                }
            }
        }}



struct SecureTextField:View {

    @State private var isSecureField: Bool = true
    @Binding var text: String
   
    var body: some View {
        HStack{
            if isSecureField{
                SecureField("Password",text: $text)
            }
            else{
                TextField(text,text: $text)
            }
        }.overlay(alignment: .trailing){
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}


struct LoginView: View {

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(UIImage(systemName: "arrow.left"), transitionMaskImage: UIImage(systemName: "arrow.left"))
        appearance.backgroundColor = UIColor.orange // Arka plan rengi beyaz
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    @StateObject private var viewModel = SignInViewModel()
    @State private var SignNavigate = false
    @State private var navigate = true
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Image("E-TİCARET LOGO")
                    .resizable()
                    .scaledToFit()
                    .offset(y:110)
                    .frame(width: 300, height: 500)
                VStack{
                    VStack{
                        TextField("e-mail", text: $viewModel.email)
                            .padding(15)
                            .frame(width: 330,height: 50)
                            .autocapitalization(.none)
                            .foregroundStyle(Color(.gray))
                            .overlay{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.orange,lineWidth: 1)
                                    .foregroundStyle(.orange)
                                    .textInputAutocapitalization(.never)
                            }
                        SecureTextField(text: $viewModel.password)
                            .padding(15)
                            .frame(width: 330,height: 50)
                            .autocapitalization(.none)
                            .foregroundStyle(Color(.gray))
                            .overlay{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.orange,lineWidth: 1)
                                    .foregroundStyle(.orange)
                                    .textInputAutocapitalization(.never)
                            }
                        Button(action: {
                            viewModel.signLogin()
                            
                        }) {
                            Text("Login")
                                .frame(width: 70)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hue: 0.092, saturation: 1.0, brightness: 0.973))
                                .cornerRadius(10)
                        }
                        .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                            HomeView()
                        }
                        HStack{
                            Rectangle()
                                .frame(height: 2)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.orange)
                            
                            Text("Other Options")
                                .padding(.horizontal, 8)
                                .foregroundColor(.gray)
                                .font(.system(size: 11))
                            
                            Rectangle()
                                .frame(height: 2)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.orange)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        HStack{
                            HStack{
                                Button(action: {openURL(URL(string: "https://secure8.store.apple.com/")!)}) {
                                    Text("")
                                        .frame(width: 0)
                                        .foregroundColor(.white)
                                        .padding()
                                        .cornerRadius(10)
                                        .background(
                                            Image("apple 1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .shadow(radius: 2)
                                        )
                                }
                            }
                            .padding()
                            HStack{
                                Button(action: {openURL(URL(string: "https://accounts.google.com/")!)
                                    
                                }) {
                                    Text("")
                                        .frame(width: 0)
                                        .foregroundColor(.white)
                                        .padding()
                                        .cornerRadius(10)
                                        .background(
                                            Image("google 1")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .shadow(radius: 2)
                                        )
                                }
                            }.padding()
                            
                            HStack{
                                Button(action: {openURL(URL(string: "https://m.facebook.com/")!)}) {
                                    Text("")
                                        .frame(width: 0)
                                        .foregroundColor(.white)
                                        .padding()
                                        .cornerRadius(10)
                                        .background(
                                            Image("facebook")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 70)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                        )
                                }
                                .offset(y:-1)
                            }
                            .padding()
                            
                        }.padding(.bottom)
                        
                        VStack{
                            HStack{
                                
                                Text("Don't have an account?")
                                    .bold()
                                    
                                Button(action: {
                                    SignNavigate = true
                                }) {
                                    Text("Sign up")
                                }
                                .navigationDestination(isPresented: $SignNavigate) {
                                    SignUpView()
                                }
                            }
                            .offset(y:20)
                        }
                    }
                }
                
            }
            .padding()
            .background(.white)
            .padding(.horizontal,20)
            .offset(y: -200)

        }
    
    }
       
}

#Preview{
    LoginView()
}
