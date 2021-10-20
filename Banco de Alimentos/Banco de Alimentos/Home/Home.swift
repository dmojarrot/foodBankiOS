//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI

struct Home: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("greenBackground"))]
        
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color(UIColor.systemBackground))
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                            
                            VStack(alignment: .center){
                                Text("Bienvenido")
                                    .foregroundColor(Color("redColor"))
                                    .bold()
                                    .font(.title2)
                                    .fontWeight(.thin)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal, 10)
                                    .padding(.top, 20)
                                Text("Con tu donativo, combatiremos el hambre y la desnutrición que padecen millones de personas en México. Si buscas otra manera de apoyar ve los anuncios y asi donaras indirectamente a nuestra causa")
                                    .font(.body)
                                    .lineLimit(nil)
                                    .padding(.horizontal, 10)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                NavigationLink(
                                    destination: WhoWeAre(),
                                    label: {
                                        Text("¿Quiénes somos?")
                                            .font(.callout)
                                            .underline()
                                            .foregroundColor(Color("greenBackground"))
                                            .padding(.bottom,10)

                                    })
                            }
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 15)

                        ZStack{
                            Rectangle()
                                .foregroundColor(Color(UIColor.systemBackground))
                                .cornerRadius(20.0)
                                .shadow(color: .black, radius: 0.4, y: 0.2)
                            VStack(spacing: 20){
                                HStack(spacing: 50){
                                    VStack{
                                        Image("familias")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color("greenBackground"))
                                            .frame(width: 50, height: 50)
                                        Text("33,568")
                                            .font(.title3)
                                            .bold()
                                        Text("Familias atendidas")
                                            .font(.caption)
                                    }
                                    VStack{
                                        Image("personas")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        Text("157,768")
                                            .font(.title3)
                                            .bold()
                                        Text("Personas atendidas")
                                            .font(.caption)
                                    }
                                }
                                HStack(spacing: 80){
                                    VStack{
                                        Image("abuelos")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        Text("7,366")
                                            .font(.title3)
                                            .bold()
                                        Text("Personas de")
                                            .font(.caption)
                                        Text("Instituciónes")
                                            .font(.caption)
                                    }
                                    VStack{
                                        Image("refugio")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        Text("126")
                                            .font(.title3)
                                            .bold()
                                        Text("Instituciónes")
                                            .font(.caption)
                                    }
                                }
                            }.padding()
                        }
                        .padding(.bottom, 15)
                        HStack{
                        NavigationLink(
                            destination: Acknowledgment(),
                            label: {
                                Text("Agradecimientos")
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color("greenBackground")))
                                
                                
                            })
                        }
                    }.padding(.horizontal, 20)
                }.navigationTitle("Home")
            }
            
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

