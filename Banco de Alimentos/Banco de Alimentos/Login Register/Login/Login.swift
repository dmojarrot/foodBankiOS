//
//  Login.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI
import FBSDKLoginKit

struct Login: View{
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("greenBackground"))]
        
    }
    @EnvironmentObject var viewModel: FirebaseAuth
    
    var body: some View{
        VStack {
            if viewModel.signedIn{
                MainView()
            }else{
                SignInView()
            }
          
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
    
}

struct SignInView: View{
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("greenBackground"))]
    }
    @State var mail = ""
    @State var password = ""
    @AppStorage("logged") var logged = false
    @State var manager = LoginManager()
    @EnvironmentObject var viewModel: FirebaseAuth

    var body: some View{
        
        
        NavigationView {
            ZStack{
                Color("background").edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(radius: 60.0, corners: [.bottomRight])
                        
                        VStack(alignment : .leading) {
                            
                            Text("Inicia sesión")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 40)
                                .padding(.bottom, 20)
                        }
                    }.padding(.bottom, 20)
                    VStack{
                            Text("Correo electrónico:")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("", text: $mail)
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                            
                            Text("Contraseña:")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            SecureField("", text: $password)
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                            NavigationLink(
                                destination: ForgotPassword(),
                                label: {
                                    Text("¿Olvidaste tu contraseña?")
                                        .font(.caption)
                                        .underline()
                                        .foregroundColor(.gray)
                                        .padding(.bottom,20)
    //                                    .frame(maxWidth: .infinity, alignment: .trailing)

                                })
                            Button(action: {
                                guard !mail.isEmpty, !password.isEmpty else{
                                    return
                                }
                                
                                viewModel.signIn(email: mail, password: password)
                                
                                
                            }, label: {
                                Text("Iniciar sesión")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("greenBackground"))
                                    .cornerRadius(20)
                                
                            })
                            
                            Text("o")
                                .frame(maxWidth: .infinity)
                            
                        Button(action: {
                            
                            if logged{
                                manager.logOut()
                                mail = ""
                                logged = false
                            }else{
                                manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, err) in
                                    if err != nil{
                                        print(err!.localizedDescription)
                                        return
                                    }
                                    
                                    if !result!.isCancelled{
                                        logged = true
                                        
                                        let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
                                        
                                        request.start{ (_, res, _) in
                                            guard let profileData = res as? [String: Any] else{return}
                                            
                                            mail = profileData["email"] as! String
                                        }
                                    }
                                    

                                
                                }
                            }
                            
                        }, label: {
                            HStack {
                                Image("facebookLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                Text("Continuar con Facebook")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.headline)
                                    
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity)


                            
                        })
                            
                            
                            
                            Divider().frame(height: 0.3).background(Color("greenBackground")).padding(.horizontal, 60).padding(.vertical, 10)
                        NavigationLink(
                            destination: Register(),
                            label: {
                                Text("Regístrate")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(.black))
                                    .cornerRadius(20)

                            })
                            
                        
                            
                        }.padding(.horizontal, 40)
                        
                    
                    
                }
                
            }.navigationTitle("Bienvenido")
        }.accentColor(Color("greenBackground"))
        
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
