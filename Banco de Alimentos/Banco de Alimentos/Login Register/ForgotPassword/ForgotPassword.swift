//
//  ForgotPassword.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI
import Firebase

struct ForgotPassword: View {
    @State var mail = ""
    @State var showAlert = false
    @State var errString: String?
    @State var messageAlert: String?
    @EnvironmentObject var viewModel: FirebaseAuth
    
    var body: some View{
        ZStack{
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
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
                        Text("Correo electrónico")
                            .font(.subheadline)
                            .fontWeight(.light)
                        TextField("", text: $mail)
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                            .padding(.bottom,20)
                        Button(action: {
                            viewModel.resetPassword(email: self.mail) { (result) in
                                switch result{
                                case .failure(_):
                                    self.errString = "Correo no reconocido, intente de nuevo."
                                    self.messageAlert = "Hemos encontrado un error"
                                case .success( _):
                                    self.errString = "Hemos enviado un enlace a su correo para que pueda cambiar su contraseña. "
                                    self.messageAlert = "Correo enviado"
                                    break
                                }
                                self.showAlert = true
                            }
                        }, label: {
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
                
            }.navigationBarTitle(Text(""), displayMode: .inline)
        }.alert(isPresented: self.$showAlert){
            Alert(title: Text(self.messageAlert!),
                  message: Text(self.errString ?? "Error"), dismissButton: .default(Text("OK")){
            })
            
        }
    }
}



struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
