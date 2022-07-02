//
//  Contactos.swift
//  Contact_List
//
//  Created by Developer on 01/07/2022.
//

import Foundation
import SwiftUI

struct Contactos:Identifiable,Hashable{
    var nome:String
    var tele:String
    var email:String
    var id:String=UUID().uuidString
}
    var contactos=[
        Contactos(nome: "Ana", tele: "967852956", email: "ana@gmail.com"),
        Contactos(nome: "Joe", tele: "935642343", email: "joe@gmail.com"),
        Contactos(nome: "Candice", tele: "918534244", email: "candice@gmail.com"),
        Contactos(nome: "John", tele: "984365737", email: "john@gmail.com")
    ]
