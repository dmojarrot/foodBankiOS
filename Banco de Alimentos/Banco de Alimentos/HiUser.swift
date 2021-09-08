//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by user195826 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white), ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("charity").resizable().edgesIgnoringSafeArea(.all)
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack {
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                                
                            VStack(alignment: .leading){
                                Text("Descripcion")
                                    .bold()
                                    .font(.title2)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal, 20)
                                .padding(.top, 20)
                                Text("En esta aplicacion podras ser capaz de donar tanto comida como dinero al banco de comidas de guadalajara. Con tu apoyo podremos llegar mas comidas a los mas necesitados:)")
                                    .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color.black)
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                            
                                
                            VStack(alignment: .leading){
                                    Text("Donar").bold().font(.title2)
                                        .padding(.bottom, 5)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        
                                    .padding(.top, 20)
                                Text("Puedes donar tanta comida como desees y tanto dinero como gustes, incluso si no tienes recursos para donar puedes simplemente ver los ADS y de esta manera donar directamente a nuestra causa").foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                    .padding(.bottom, 30)
                                }
                        }.frame(width: .infinity, height: 240)

                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                  

                    
                    VStack (alignment: .leading) {
                        
                        Spacer()
                        VStack {
                            VStack{
                                NavigationLink(
                                    destination: Profile(),
                                    label: {
                                        Label("Mi perfil", systemImage: "person.crop.circle")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .multilineTextAlignment(.leading)
                                            .frame(maxWidth: .infinity)
                                            .background(RoundedRectangle(cornerRadius: 20)
                                                            .fill(Color.black))
                                        
                                        
                                    })
                                
                                
                                
                                Spacer()
                            }.padding(.top, 30).padding(.horizontal, 70)
                            
                        }
                        
                    }.navigationTitle("Bienvenido")
                    
                }.padding(.horizontal, 20)
            }
        }
    }
}








struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        HiUser()
    }
}





