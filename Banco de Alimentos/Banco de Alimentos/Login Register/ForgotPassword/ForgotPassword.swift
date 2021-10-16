//
//  ForgotPassword.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI

struct ForgotPassword: View {
    @State var mail = ""
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color("squareColors"))
                        .cornerRadius(radius: 60.0, corners: [.bottomRight])
                    
                    VStack(alignment : .leading) {
                        Text("¿Olvidaste tu contraseña?")
                            .font(.largeTitle)
                            .foregroundColor(Color("greenBackground"))
                            .bold()
                            .padding(.top, 20)
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        
                        
                        Text("Ingresa tu correo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                            .padding(.bottom, 20)
                    }
                }.padding(.bottom, 20)
                VStack(alignment: .leading){
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
                        Button(action: {}, label: {
                            Text("Enviar")
                                .foregroundColor(.white)
                                .bold()
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("greenBackground"))
                                .cornerRadius(20)
                                .padding(.bottom,40)
                            
                        })
                    }
                    
                }.padding(.horizontal, 30)
                
            }
        }.navigationBarTitle(Text(""), displayMode: .inline)
    }
}



struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
