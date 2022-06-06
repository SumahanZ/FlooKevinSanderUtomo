//
//  ProfileViewmodel.swift
//  Floo
//
//  Created by SIFT - Telkom DBT Air 1 on 06/06/22.
//

import Foundation

class ProfileViewmodel : ObservableObject {
    
    @Published var user: Chef = Chef(name: "Kevin Sander Utomo", speciality: ["Butter Chicken" , "Prata Bread", "Fish Curry", "Kofta"], description: "After attending computer science school, I am interested in cooking food especially Indian food. Prata bread and butter chicken are my favourite foods", title: "Home Chef" )
    
    
    
    
    public func loadUserData () {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "userData") as? Data {
            let taskData = try? decoder.decode(Chef.self, from: data)
            user = taskData!
            self.user.name = user.name
            self.user.title = user.title
            self.user.description = user.description
            self.user.speciality = user.speciality
        } else {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.user) {
                UserDefaults.standard.set(encoded, forKey: "userData")
         }
        }
    }
    
    public func editProfile(EditedUser: Chef) {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: "userData") as? Data {
            let taskData = try? decoder.decode(Chef.self, from: data)
            user = taskData!
            
            user = EditedUser
        }
        
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.user) {
                UserDefaults.standard.set(encoded, forKey: "userData")
         }
    }
}
