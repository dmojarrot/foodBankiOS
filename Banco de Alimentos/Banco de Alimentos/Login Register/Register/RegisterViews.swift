//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI
import Firebase
import CoreMIDI

struct Register: View {
    @State var mail = ""
    @State var password = ""
    @State var confirmPassword = ""
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        
                        Text("¿No tienes cuenta?")
                            .font(.largeTitle)
                            .foregroundColor(Color("grayTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Regístrate")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 40)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.subheadline)
                        .fontWeight(.light)
                    TextField("", text: $mail)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                        .padding(.bottom,20)
                    Text("Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $password)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Confirmar Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    SecureField("", text: $confirmPassword)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    NavigationLink(
                        destination: Register2(mail: mail, password: password),
                        label: {
                            Text("Continuar")
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                        })
                    
                    
                    
                }.padding(.horizontal, 40)
            }
        }.navigationBarTitle(Text(""), displayMode: .inline)
    }
    
}

struct Register2: View {
    @EnvironmentObject var viewModel: FirebaseAuth
    @State var mail: String
    @State var password: String
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var genre = ""
    @State var birthDate = ""
    
    @State var selection: String = "Genero"
    let filterOptions: [String] = ["Masculino", "Femenino", "Otro"]
    
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("Finaliza tu                cuenta")
                            .font(.largeTitle)
                            .foregroundColor(Color("grayTitle"))
                            .bold()
                            .padding(.top, 10 )
                            .padding(.leading, 20)
                            .padding(.bottom, 40)
                        
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Nombre")
                                .font(.subheadline)
                                .fontWeight(.light)
                            TextField("", text: $name)
                                .padding()
                                .background(Color("squareColors"))
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
                                .background(Color("squareColors"))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                                .padding(.bottom,20)
                        }
                    }
                    
                    Text("Celular")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $cellphone)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    
                    Text("Genero")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Picker(
                        selection: $selection,
                        label:
                            HStack{
                                Text("Genre: ")
                                Text(selection)
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                        ,
                        content: {
                            ForEach(filterOptions, id: \.self) { option in
                                HStack{
                                    Text(option)
                                }
                                .tag(option)
                            }
                            
                        })
                    
                    
                    
                    Text("Fecha de Nacimiento")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $birthDate)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Button(action: {
                        guard !name.isEmpty, !lastName.isEmpty, !cellphone.isEmpty, !genre.isEmpty, !birthDate.isEmpty else{
                            return
                        }
                        viewModel.signUp(email: mail, password: password)
                    }, label: {
                        Text("Registrarse")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("greenBackground"))
                            .cornerRadius(20)
                        
                    })
                    
                }.padding(.horizontal, 40)
            }.accentColor(Color("greenBackground"))
        }.navigationBarTitle(Text(""), displayMode: .inline)
    }
    
    func AddInfo(name: String, lastName: String, cellphone: String, genre: String, birthDate: String){
        let db = Firestore.firestore()
        db.collection("users").document().setData(["Name": name, "lastName": lastName, "cellphone": cellphone, "genre": genre, "birthdate": birthDate])
        
    }
    
}





struct Register2_preview: PreviewProvider {
    static var previews: some View {
        Register2(mail: "", password: "")
        
    }
}
