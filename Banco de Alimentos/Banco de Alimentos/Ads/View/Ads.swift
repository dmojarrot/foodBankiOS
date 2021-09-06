//
//  Ads.swift
//  Banco de Alimentos
//
//  Created by user192057 on 9/6/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        
        GeometryReader{geo in
            player().frame(height: geo.size.height).cornerRadius(20).padding()
        }
    }
}

struct player: UIViewControllerRepresentable{
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPLayerViewController {
        
        let controller = AVPLayerViewController()
        let player1 = AVPlayer(url: URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPLayerViewController, context: UIViewControllerRepresentableContext<player>){
        
    }
    
}


struct Ads_Previews: PreviewProvider {
    static var previews: some View {
        Ads()
    }
}
