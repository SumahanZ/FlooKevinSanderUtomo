//
//  ProfileEditView.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 06/06/22.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var user: Chef
    @StateObject var viewModel = ProfileViewmodel()
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ScrollView {
            VStack {
            Text("Edit Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20).padding(.trailing, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
            
                VStack {
                    VStack {
                        Text("General")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.leading, 25.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Name", text: $user.name)
                            .padding(.horizontal, 30).padding(.trailing, 20)
                    Divider()
                     .padding(.horizontal, 30)
                        TextField("Title", text: $user.title)
                            .padding(.horizontal, 30).padding(.trailing, 20)
                    Divider()
                     .padding(.horizontal, 30)
                    
                        TextField("About you", text: $user.description)
                            .padding(.horizontal, 30).padding(.trailing, 20)
                        
                    Divider()
                     .padding(.horizontal, 30)
                
                    }
                    .padding(.top)
                    

                    VStack {
                        Text("Ingredients")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.leading, 25.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(0..<$user.speciality.count, id: \.self) {index in
                                            TextField("Speciality \(index + 1)", text: $user.speciality[index]).padding(.horizontal, 30).padding(.trailing, 20)
                        }
                    }
                    
                          Button {
                            user.speciality.append("")
                        } label: {
                            Text("Add more speciality")
                        }.padding(.top,20)
                    
                    Button {
                        viewModel.editProfile(EditedUser: self.user)
                        self.presentation.wrappedValue.dismiss()
                    }label: {
                        HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }.padding(.all, 10.0)
                            .frame(maxWidth: 240, alignment: .center)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.541, saturation: 0.997, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                            .padding(.all, 10.0)

                    }
                    
                }
            }
                
            }
        }
    }
