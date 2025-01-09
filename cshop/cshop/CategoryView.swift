//
//  CategoryView.swift
//  cshop
//
//  Created by Cengizhan Özyurt on 4.12.2024.
//
import SwiftUI
import UIKit
struct CategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var ComputerNavigate = false
    @State private var PhoneNavigate = false
    @State private var ElectonicNavigate = false
    @State private var SoftwareNavigate = false
    @State private var ArticleNavigate = false
    @State private var NotesNavigate = false
    @State private var MeetingNavigate = false
    @State private var OnlineNavigate = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        ComputerNavigate = true
                    }) {
                        
                        Text("Computer")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("computerBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding(.leading)
                    .navigationDestination(isPresented: $ComputerNavigate){
                        ComputerView()
                    }
                    Button(action: {
                        PhoneNavigate = true
                    }) {
                        Text("Phone")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("phoneBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding()
                    .navigationDestination(isPresented: $PhoneNavigate){
                        PhoneView()
                    }
                }
                Spacer()
                    .frame(height: 0)
                
                HStack{
                    Button(action: {
                        ElectonicNavigate = true
                    }) {
                        Text("Electronic")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("electronicBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding(.leading)
                    .navigationDestination(isPresented: $ElectonicNavigate){
                        ElectronicView()
                    }
                    
                    Button(action: {
                        SoftwareNavigate = true
                    }) {
                        Text("Software")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("SoftwareBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding()
                    .navigationDestination(isPresented: $SoftwareNavigate){
                        SoftwareView()
                    }
                }
                Spacer()
                    .frame(height: 0)
                HStack{
                    Button(action: {
                        ArticleNavigate = true
                    }) {
                        Text("Article")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .bold()                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("ArticleBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding(.leading)
                    .navigationDestination(isPresented: $ArticleNavigate){
                        ArticleView()
                    }
                    Button(action: {
                        NotesNavigate = true
                    }) {
                        Text("Notes")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .bold()                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("NotesBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding()
                    .navigationDestination(isPresented: $NotesNavigate){
                        NotesView()
                    }
                }
                Spacer()
                    .frame(height: 0)
                HStack{
                    Button(action: {
                        MeetingNavigate = true
                    }) {
                        Text("Meeting")
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                            .bold()                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("meetingBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding(.leading)
                    .navigationDestination(isPresented: $MeetingNavigate){
                        MeetingView()
                    }
                    Button(action: {
                        OnlineNavigate = true
                    }) {
                        Text("Online Course")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .padding(15)
                            .frame(width: 140,height: 140)
                            .background(
                                Image("OnlineLessonBG")
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            )
                    }
                    .padding()
                    .navigationTitle("Category")
                        .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(isPresented: $OnlineNavigate){
                        OnlineCourseView()
                    }
                }
            }
        }
    }
}
#Preview {
//    LoginView()
    CategoryView()
}

