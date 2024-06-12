//
//  SearchTextField.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct SearchTextField: View {

    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

            TextField(placeholder, text: $txt)
                .font(.customfont(.regular, fontSize: 18))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)

        }
        .frame(height: 30)
        .padding(10)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}

struct SearchTextField_Previews: PreviewProvider {

    @State static var txt: String = ""
    
    static var previews: some View {
        SearchTextField(placeholder: "Найдется все", txt: $txt)
            .padding(15)
    }
}
