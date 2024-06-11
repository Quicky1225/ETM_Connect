//
//  LoginView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 26.02.2024.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                
                Image("dark_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Вход")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Введите свою почту и пароль")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(title: "Почта", placeholder: "Введите вашу почту", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureFiled(title: "Пароль", placeholder: "Введите ваш пароль", txt:$loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                Button{
                    
                } label: {
                    Text("Забыли пароль ?")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "Войти") {
                    loginVM.serviceCallLogin()
                }
                    .padding(.bottom, .screenWidth * 0.05)
                
                NavigationLink{
                    SignUpView()
                } label: {
                    HStack{
                        Text("Нет аккаунта ?")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Зарегистрироваться")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                    }
                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                
                HStack {
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $loginVM.showError) {
            
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage), dismissButton: .default(Text("OK")))
            
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            LoginView()
        }
        
    }
}
