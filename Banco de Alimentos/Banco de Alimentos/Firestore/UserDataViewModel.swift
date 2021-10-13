//
//  UserDataViewModel.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 13/10/21.
//

import Foundation
import FirebaseFirestore

class UserDataViewModel: ObservableObject{
    @Published var users = [UserData]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("users").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else{
                print("no documents")
                return
            }
            self.users = documents.map { (QueryDocumentSnapshot) -> UserData in
                let data = QueryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                let cellphone = data["cellphone"] as? String ?? ""
                let birthdate = data["birthdate"] as? String ?? ""
                return UserData(name: name, lastName: lastName, genre: genre, cellphone: cellphone, birthDate: birthdate)
            }
        }
    }
}
