//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI

struct Home: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white)]
        UINavigationBar.appearance().tintColor = UIColor.init(Color("greenBackground"))

    }
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, Color.gray]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack{
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
                                    .padding(.horizontal, 10)
                                .padding(.top, 20)
                                Text("En esta aplicacion podras ser capaz de donar tanto comida como dinero al banco de comidas de guadalajara. Con tu apoyo podremos llegar mas comidas a los mas necesitados:)")
                                    .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .cornerRadius(20.0)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        VStack(alignment: .leading){
                                Text("Donar").bold().font(.title2)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal, 20)
                                .padding(.top, 20)
                                Text("Puedes donar tanta comida como desees y tanto dinero como gustes, incluso si no tienes recursos para donar puedes simplemente ver los ADS y de esta manera donar directamente a nuestra causa")
                                    .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                            }
                    }
                    .padding(.bottom, 20)
                        
                        NavigationLink(
                            destination: Acknowledgment(),
                            label: {
                                Label("Agradecimientos", systemImage: "face.smiling")
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color("greenBackground")))

                                
                            })
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

