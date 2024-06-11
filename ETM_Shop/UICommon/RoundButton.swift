//
//  RoundButton.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 25.02.2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (()->())?
    
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 25))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(20)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
