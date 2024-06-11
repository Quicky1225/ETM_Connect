//
//  MainTabView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack{
            
            VStack{
//                Spacer()
                
                HStack{
                    Button {
                        MainViewModel.shared.isUserLogin = false
                    } label: {
                        Text("Выйти")
                    }
                }
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
