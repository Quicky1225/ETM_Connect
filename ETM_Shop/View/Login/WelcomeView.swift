//
//  WelcomeView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 25.02.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("back_ground")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 350)
                
                Text("Привет.")
                    .font(.customfont(.medium, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("Мир стройматериалов ждет вас!")
                    .font(.customfont(.regular, fontSize: 20))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Начать пользоваться")
                        .font(.customfont(.semibold, fontSize: 25))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                .background(Color.primaryApp)
                .cornerRadius(20)
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WelcomeView()
        }
    }
}
