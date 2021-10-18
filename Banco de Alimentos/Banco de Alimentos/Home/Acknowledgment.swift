//
//  Acknowledgment.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI

struct Acknowledgment: View {
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ScrollView{
                
                VStack{
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .cornerRadius(20.0)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        VStack{
                            Text("¡Muchas gracias por formar parte!")
                                .fontWeight(.bold)
                                .foregroundColor(Color( red: 219/255, green: 81/255, blue: 86/255))
                                .bold()
                                .font(.title3)
                                .padding(.bottom, 5)
                                .padding(.horizontal, 10)
                                .padding(.top, 20)
                            Text("Gracias a tu donación hemos podido ayudar a 3 familias completas de 4 integrantes, las cuales te agradecen de corazón el apoyo que les has brindado para una causa buena en nuestra sociedad")
                                .multilineTextAlignment(.center)
                                
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    
                    
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            Image("galeria-1")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(40)
                                .frame(width: 300, height: 300)
                                

 
                            Image("galeria-2")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(40)
                                .frame(width: 300, height: 300)

                            Image("galeria-3")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(40)
                                .frame(width: 300, height: 300)
                            
                            Image("galeria-4")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(40)
                                .frame(width: 300, height: 300)
                            

                        }.padding(.bottom)
                    }
                    
                    
//                    Image("logoApple")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 80, height: 80)
                    
                    
                    Spacer()
                }.padding(.horizontal, 20)
            }.navigationTitle("Agradecimientos")
        }
        
    }
}

struct Acknowledgment_Previews: PreviewProvider {
    static var previews: some View {
        Acknowledgment()
    }
}
