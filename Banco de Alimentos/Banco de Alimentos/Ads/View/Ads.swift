//
//  Ads.swift
//  Banco de Alimentos
//
//  Created by user192057 on 9/6/21.
//

import SwiftUI
import AVKit

struct Ads: View {
    @State var height : CGFloat = 0
    @State var show = false
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.bottom)
            VStack{
                GeometryReader{geo in
                    
                    player().frame(height: geo.size.height / 3).cornerRadius(20).padding().gesture(DragGesture()
                                                                                                    .onChanged({ (value) in
                                                                                                        self.height = value.translation.height / 10
                                                                                                    })
                                                                                                    
                                                                                                    .onEnded({ (value) in
                                                                                                        if self.height > geo.size.height / 2 - 100 {
                                                                                                            self.height = 1500
                                                                                                            self.show.toggle()
                                                                                                        }
                                                                                                        if -self.height > geo.size.height / 2 - 100 {
                                                                                                            self.height = -1500
                                                                                                            self.show.toggle()
                                                                                                        }
                                                                                                    })
                    ).offset(y: self.height)
                    
                    
                }
                
            }.animation(.spring())
        }
    }
}


struct player: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        let player1 = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>){
        
    }
    
}


struct Ads_Previews: PreviewProvider {
    static var previews: some View {
        Ads()
    }
}
