//
//  MainTabView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack{
            
            TabView(selection: $homeVM.selectTab){
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectTab) { newValue in
                debugPrint("Sel Tab :\(newValue)")
            }
            
            HStack{
                
                // Вкладка магазина
                TabButton(title: "Магазин", icon: "store_tab", isSelect: homeVM.selectTab == 0) {
                    
                    DispatchQueue.main.async{
                        withAnimation{
                            homeVM.selectTab = 0
                        }
                    }
                    
                }
                
                // Вкладка каталога
                TabButton(title: "Каталог", icon: "explore_tab", isSelect: homeVM.selectTab == 1) {
                    DispatchQueue.main.async{
                        withAnimation{
                            homeVM.selectTab = 1
                        }
                    }
                }

                
                // Вкладка корзины
                TabButton(title: "Корзина", icon: "cart_tab", isSelect: homeVM.selectTab == 2) {
                    DispatchQueue.main.async{
                        withAnimation{
                            homeVM.selectTab = 2
                        }
                    }
                }
                
                // Вкладка избранное

                TabButton(title: "Избранное", icon: "fav_tab", isSelect: homeVM.selectTab == 3) {
                    DispatchQueue.main.async{
                        withAnimation{
                            homeVM.selectTab = 3
                        }
                    }
                }
                
                // Вкладка аккаунт
                TabButton(title: "Аккаунт", icon: "account_tab", isSelect: homeVM.selectTab == 4) {
                    DispatchQueue.main.async{
                        withAnimation{
                            homeVM.selectTab = 4
                        }
                    }
                }
                
            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            
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
