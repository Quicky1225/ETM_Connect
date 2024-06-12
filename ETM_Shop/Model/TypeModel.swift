//
//  TypeModel.swift
//  ETM_Shop
//
//  Created by Дмитрий Шеин on 12.06.2024.
//

import SwiftUI

struct TypeModel: Identifiable, Equatable {
    
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    var color: Color = Color.primaryApp
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.name = dict.value(forKey: "type_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "")

    }
    
    static func == (lhs: TypeModel, rhs: TypeModel) -> Bool {
        return lhs.id == rhs.id
    }
}


