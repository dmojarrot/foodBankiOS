//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI

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
                            .foregroundColor(Color("greenTitle"))
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
    @State var mail: String
    @State var password: String
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var genre = ""
    @State var birthDate = ""
    
    var body: some View{
            ZStack{
                Color("background").edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color("squareColors"))
                            .cornerRadius(radius: 60.0, corners: [.bottomRight])
                        
                        VStack(alignment : .leading) {
                            Text("Finaliza tu               cuenta")
                                .font(.largeTitle)
                                .foregroundColor(Color("greenTitle"))
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
                        
                        TextField("", text: $genre)
                            .padding()
                            .background(Color("squareColors"))
                            .cornerRadius(20)
                            .padding(.bottom,20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Text("Fecha de Nacimiento")
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        TextField("", text: $birthDate)
                            .padding()
                            .background(Color("squareColors"))
                            .cornerRadius(20)
                            .padding(.bottom,40)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        Button(action: {}, label: {
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
                }
            }.navigationBarTitle(Text(""), displayMode: .inline)
    }
}




struct Register2_preview: PreviewProvider {
    static var previews: some View {
        Register()
        
    }
}
