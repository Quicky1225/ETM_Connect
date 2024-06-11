//
//  ETM_ShopApp.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 25.02.2024.
//

import SwiftUI

@main
struct ETM_ShopApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
