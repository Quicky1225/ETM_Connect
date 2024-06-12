//
//  HomeView.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("dark_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                    
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("Самара, Россия")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.darkGray)
                    }
                    
                    SearchTextField(placeholder: "Найдется все", txt: $homeVM.txtSearch)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
                .padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 115)
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Распродажа", titleAll: "Смотреть все"){
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.offerArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                }
                
                SectionTitleAll(title: "Популярные товары", titleAll: "Смотреть все"){
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.bestArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                }
                
                SectionTitleAll(title: "Товары", titleAll: "Смотреть все"){
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.typeArr, id: \.id) {
                            tObj in
                            
                            CategoryCell(tObj: tObj) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                }
                .padding(.bottom, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.listArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                }
                .padding(.bottom, 15)
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
