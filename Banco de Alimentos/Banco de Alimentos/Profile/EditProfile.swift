//
//  Profile.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI
import Firebase

struct EditProfile: View {    
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var email = ""

    @EnvironmentObject var viewModelFB: FirebaseAuth

    
    var body: some View{
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ScrollView{
                    VStack(alignment: .leading){
                        HStack{
                            VStack(alignment: .leading){
                                Text("Nombre")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                TextField("", text: $name)
                                    .padding()
                                    .background(Color(UIColor.systemBackground))
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 0.4, y: 0.2)
                                    .padding(.bottom,20)
                            }
                            VStack(alignment: .leading){
                                Text("Apellido")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                TextField("", text: $lastName)
                                    .padding()
                                    .background(Color(UIColor.systemBackground))
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 0.4, y: 0.2)
                                    .padding(.bottom,20)
                            }
                        }.padding(.top, 20)
//                        VStack(alignment: .leading){
//                        Text("Correo electrónico")
//                            .font(.subheadline)
//                            .fontWeight(.light)
//                        
//                        TextField("\(email)", text: $email)
//                            .padding()
//                            .background(Color(UIColor.systemBackground))
//                            .cornerRadius(20)
//                            .padding(.bottom,20)
//                            .shadow(color: .black, radius: 0.4, y: 0.2)
//                        }
                        
                        
                        Text("Celular")
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        TextField("\(cellphone)", text: $cellphone)
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(20)
                            .padding(.bottom,20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Text("Contraseña")
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        SecureField("", text: $password)
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(20)
                            .padding(.bottom,20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Text("Confirmar contraseña")
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        SecureField("", text: $confirmPassword)
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(20)
                            .padding(.bottom,40)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Button(action: {}, label: {
                            Text("Guardar cambios")
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                            
                        })
                        
                    }.padding(.horizontal, 40)
            }.navigationBarTitle("Editar perfil")
        }.onAppear {
            let db = Firestore.firestore()
            db.collection("users").document((viewModelFB.auth.currentUser?.email)!).getDocument { documentSnapshot, error in
                if let document = documentSnapshot, error == nil{
                    if let nameFB = document.get("Name") as? String {
                        self.name = nameFB
                    }
                    if let lastnameFB = document.get("LastName") as? String {
                        self.lastName = lastnameFB
                    }
                    if let cellphoneFB = document.get("Cellphone") as? String {
                        self.cellphone = cellphoneFB
                    }
                }
            }

        }
        }
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
