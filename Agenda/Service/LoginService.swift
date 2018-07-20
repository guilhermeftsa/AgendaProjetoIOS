//
//  LoginService.swift
//  Agenda
//
//  Created by administrador on 18/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
import Realm
import RealmSwift

protocol LoginServiceDelegate{
    func postLoginSuccess()
    func postLoginFailure(error: String)
    
}

class LoginService{
    
    var delegate: LoginServiceDelegate
    
    required init (delegate:LoginServiceDelegate){
        self.delegate = delegate
    }
    
    func postlogin(email:String, senha: String){
        loginRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data"){            (response: DataResponse<Usuario>) in
            
            switch response.result{
            case .success:
                
                if let user = response.result.value{
                    UsuarioViewModel.clear()
                   
                    UsuarioViewModel.save(usuario: user)
                    SessionControl.setHeadersParams(headers: response.response?.allHeaderFields)

                }
                self.delegate.postLoginSuccess()
                
            case .failure(let error):
                self.delegate.postLoginFailure(error: error.localizedDescription)
            }
        }
    }
}
