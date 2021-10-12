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
            Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, Color.gray]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
            ScrollView{
                
                VStack{
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .cornerRadius(20.0)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        VStack{
                            Text("Muchas gracias por formar parte!")
                                .fontWeight(.bold)
                                .foregroundColor(Color( red: 219/255, green: 81/255, blue: 86/255))
                                .bold()
                                .font(.title3)
                                .padding(.bottom, 5)
                                .padding(.horizontal, 10)
                                .padding(.top, 20)
                            Text("Gracias a tu donación hemos podido ayudar a 3 familias completas de 4 integrantes, las cuales te agradecen de mucho corazón el apoyo que les has brindado para una causa buena en nuestra sociedad!")
                                .multilineTextAlignment(.center)
                                
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    
                    VideoView(videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")!, previewLength: 30)
                        .cornerRadius(15)
                        .frame(width: nil, height: 250, alignment: .center)
                        .shadow(color: .black, radius: 0.4, y: 0.2)
                    
                    Image("logoApple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    
                    
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
