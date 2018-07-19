//
//  Usuario.swift
//  Agenda
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//
import RealmSwift
import Realm
import ObjectMapper

class Usuario : Object, Mappable {
    
    required convenience init?(map: Map) {
        self.init()
    }
    override static func primaryKey() -> String?{
        return "id"
    }
    
    var id = RealmOptional<Int>()
    @objc dynamic var email: String?
    
    
   @objc dynamic var accessToken: String?
   @objc dynamic var client: String?
   @objc dynamic var uid: String?
    
   
    
    func mapping(map: Map) {
        self.id.value <- map ["id"]
        self.email <- map ["email"]
    }
    
    
}

extension Usuario{
    func setHeaderParams(header: [AnyHashable: Any]?){
        guard let header = header else{
            return
        }
        if let uid = header["Uid"] as? String{
            self.uid = uid
        }
        if let client = header["Client"] as? String{
            self.client = client
        }
        if let accessToken = header["Access-Token"] as? String{
            self.accessToken = accessToken
        }
    }
}
