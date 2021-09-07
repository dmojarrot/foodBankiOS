//
//  Acknowledgment.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct Acknowledgment: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    
                    VStack(alignment: .leading){
                        Text("Muchas gracias por formar parte!")
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 30)
                            .font(.subheadline)
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                            .padding(30)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white))
                            .padding(.bottom, 60)
                        
                        VideoView(videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")!, previewLength: 30)
                            .cornerRadius(15)
                            .frame(width: nil, height: 250, alignment: .center)
                            .shadow(color: Color.black.opacity(0.1), radius: 60, x: 0, y: 2)
                            .padding(.bottom, 10)
                        
                        
                        Spacer()
                    }.padding(.horizontal, 20)
                }
            }.navigationTitle("Agradecimientos")
            
        }
    }
}

struct Acknowledgment_Previews: PreviewProvider {
    static var previews: some View {
        Acknowledgment()
    }
}
