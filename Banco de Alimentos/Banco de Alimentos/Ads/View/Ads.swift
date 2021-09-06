//
//  Ads.swift
//  Banco de Alimentos
//
//  Created by user192057 on 9/6/21.
//

import SwiftUI
import AVKit

struct Ads: View {
    var body: some View {
        
        GeometryReader{geo in
            player().frame(height: geo.size.height / 3).cornerRadius(20).padding()
        }
    }
}

struct player: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        let player1 = AVPlayer(url: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
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
