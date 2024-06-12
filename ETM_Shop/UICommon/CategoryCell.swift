//
//  CategoryCell.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    
    @State var tObj: TypeModel = TypeModel(dict: [:])
    
    @State var color: Color = Color.primaryApp
    
    var didAddCart: (() -> ())?
    
    var body: some View {
        HStack{
            
            WebImage(url: URL(string: tObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100, height: 80)
            
            Text(tObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(tObj.color.opacity(0.3))
        .cornerRadius(16)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(tObj: TypeModel(dict: ["type_id": 1,
                                            "type_name": "Pulses",
                                            "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                            "color": "F8A44C"]))
    }
}
