//
//  SignUpView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 11.06.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView{
                VStack {
                    
                    Image("dark_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding(.bottom, .screenWidth * 0.05)
                    
                    Text("Новый аккаунт")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Введите ваши данные, чтобы продолжить")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    LineTextField(title: "Имя пользователя", placeholder: "Введите ваше имя", txt: $mainVM.txtUsername)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Почта", placeholder: "Введите вашу почту", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureFiled(title: "Пароль", placeholder: "Введите ваш пароль", txt:$mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    VStack {
                        Text("Создавая аккаунт, вы соглашаетесь с нашими")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack{

                            Text("правилами")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                            
                            Text("и")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.gray)
                            
                            Text("политикой.")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                            
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    RoundButton(title: "Создать аккаунт") {
                        mainVM.serviceCallSignUp()
                    }
                        .padding(.bottom, .screenWidth * 0.05)
                    
                    NavigationLink{
                        LoginView()
                    } label: {
                        HStack{
                            Text("Есть аккаунт ?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Войти")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryApp)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
            VStack{
                
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage), dismissButton:.default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
