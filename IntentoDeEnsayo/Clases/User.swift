//
//  User.swift
//  IntentoDeEnsayo
//
//  Created by Ariana Esquivel on 03/03/21.
//

import UIKit

class User: Codable {
    var username:String!
    var correo:String!
    var password:String!
    
    init(_ username:String,_ correo:String, _ password:String) {
        self.username = username
        self.correo = correo
        self.password = password
    }
    
    func store(ve: UIViewController){
        App.shared.users = User.getUsers()
        App.shared.users.append(self)
        do{
            let encode = JSONEncoder()
            let data = try encode.encode(App.shared.users)
            App.shared.defaults.setValue(data, forKey: "users")
            ve.alertDefault(with: "Usuario Registrado", andWithMsg: "El usuario se ha registrado con exito")
        }catch{
            ve.alertDefault(with: "Usuario No registrado", andWithMsg: "El usuario no se ha podido registrar")
        }
    }
    
    static func getUsers() -> [User]{
        if let data = App.shared.defaults.object(forKey: "users") as? Data{
            let decoder = JSONDecoder()
            guard let users = try? decoder.decode([User].self, from: data) else { fatalError("No se ha logrado hacer el parseo")
            }
            return users
        }
        return [User]()
    }
}
