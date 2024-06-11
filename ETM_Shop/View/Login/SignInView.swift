//
//  SignInView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 25.02.2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("Добро пожаловать \nв мир строительства!")
                        .font(.customfont(.regular, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                    
                    HStack {
                        
                        Button{
                            isShowPicker = true
                        } label: {
//                            Image("")
                            
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.regular, fontSize: 30))
                                    
                            }
                            
                            if let countryObj = countryObj {
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.regular, fontSize: 26))
                                    .foregroundColor(.primaryText)
                            }
                            
                        }
                        
                        TextField("Введите свой номер", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Продолжить вход по почте")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Продолжить регистрацию по почте")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    Divider()
                        .padding(.bottom, 20)
                    
                    Text("Или зайдите, через соц.сети")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                    Button {
                        
                    } label: {
                        
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Продолжить с Яндекс")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "D64933"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    

                }
                
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.8)
                
                
            }
            
        }
        .onAppear{
            self.countryObj = Country(phoneCode: "52", isoCode: "MX")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
