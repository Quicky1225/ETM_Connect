//
//  SectionTitleAll.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct SectionTitleAll: View {
    
    @State var title: String = "Заголовок"
    @State var titleAll: String = "Смотреть все"
    var didTap: (()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
        }
        .frame(height: 40)
    }
}

struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitleAll()
    }
}
