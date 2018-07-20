//
//  Contato.swift
//  Agenda
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Contato: Object, Mappable{
    
    var id = RealmOptional<Int>()
    
    @objc dynamic var nome: String?
    @objc dynamic var aniversario: Date?
    @objc dynamic var email: String?
    @objc dynamic var telefone: String?
    @objc dynamic var foto: String?
    
    func mapping(map: Map) {
        self.id.value <- map["id"]
        self.nome <- map["name"]
        self.aniversario <- map["birth"]
        self.email <- map["email"]
        self.telefone <- map["phone"]
        self.foto <- map["picture"]
    }
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
    required convenience init?(map:Map){
        self.init()
    }
}
