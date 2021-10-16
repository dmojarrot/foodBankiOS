//
//  Ads.swift
//  Banco de Alimentos
//
//  Created by Team2 on 9/6/21.
//

import SwiftUI
import AVFoundation
import AVKit

struct Ads: View {
    
    @State var maxHeight:CGFloat = 190
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack{
//                        VideoView(videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")!, previewLength: 30)
//                            .cornerRadius(15)
//                            .frame(width: nil, height: maxHeight, alignment: .center)
//                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
//                            .padding(.bottom, 10)
                        
                        
                        Image("bbkAds")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: nil, height: 211, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.bottom, 10)
                        
                        
                        Image("anuncioPublicitarioBachoco")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: nil, height: maxHeight, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.bottom, 10)
                        
                        
                        Image("uberEatsAds")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: nil, height: maxHeight, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.bottom, 10)
                        
                    }.padding(.horizontal, 30).padding(.top, 10)
                    
                    Spacer()
                    
                }.navigationTitle("Ads")
            }
        }
    }
}




struct Ads_Previews: PreviewProvider {
    static var previews: some View {
        Ads()
    }
}
