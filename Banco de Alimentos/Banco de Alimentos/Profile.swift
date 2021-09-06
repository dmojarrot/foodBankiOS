//
//  Profile.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct Profile: View {
    @State var name = ""
    @State var lastName = ""
    @State var cellphone = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var email = ""
    
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                
                VStack(alignment: .leading){
                    Text("My Profile")
                        .font(.largeTitle)
                        .foregroundColor(Color("greenTitle"))
                        .bold()
                        .padding(.top, 10 )
                        .padding(.leading, 20)
                        .padding(.bottom, 40)
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
                    VStack(alignment: .leading){
                    Text("Correo Electronico")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $email)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
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
                    
                    Text("Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $password)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,20)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Text("Confirmar Contraseña")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    TextField("", text: $confirmPassword)
                        .padding()
                        .background(Color("squareColors"))
                        .cornerRadius(20)
                        .padding(.bottom,40)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Button(action: {}, label: {
                        Text("Guardar Cambios")
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
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
