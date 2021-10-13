//
//  UserData.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 13/10/21.
//

import Foundation

struct UserData: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var lastName: String
    var genre: String
    var cellphone: String
    var birthDate: String
}
