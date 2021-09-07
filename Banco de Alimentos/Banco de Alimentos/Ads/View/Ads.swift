//
//  Ads.swift
//  Banco de Alimentos
//
//  Created by user192057 on 9/6/21.
//

import SwiftUI
import AVFoundation
import AVKit

struct Ads: View {
    
    @State var maxHeight:CGFloat = 190
    
        var body: some View {
            NavigationView{
                ScrollView {
                    VStack {
                        VideoView(videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")!, previewLength: 60)
                            .cornerRadius(15)
                            .frame(width: nil, height: maxHeight, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.horizontal, 20)
                            .padding(.top, 7)
                    }
                    
                    VStack {
                        Image("anuncioPublicitarioBachoco")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: nil, height: maxHeight, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.horizontal, 20)
                            .padding(.top, 7)
                    }
                    
                    VStack {
                        Image("uberEatsAds")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: nil, height: maxHeight, alignment: .center)
                            .shadow(color: Color.black.opacity(0.7), radius: 30, x: 0, y: 2)
                            .padding(.horizontal, 20)
                            .padding(.top, 7)
                    }
                    
                    Spacer()
                    
                }.navigationTitle("Ads")
                
                
                
        }
    }
}


struct VideoView: UIViewRepresentable {
    
    var videoURL:URL
    var previewLength:Double?
    
    func makeUIView(context: Context) -> UIView {
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

class PlayerView: UIView {

    private let playerLayer = AVPlayerLayer()
    private var previewTimer:Timer?
    var previewLength:Double
    
    init(frame: CGRect, url: URL, previewLength:Double) {
        self.previewLength = previewLength
        super.init(frame: frame)
        
        // Create the video player using the URL passed in.
        let player = AVPlayer(url: url)
        player.volume = 0 // Will play audio if you don't set to zero
        player.play() // Set to play once created.
        
        // Add the player to our Player Layer
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill // Resizes content to fill whole video layer.
        playerLayer.backgroundColor = UIColor.black.cgColor

        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { (timer) in
            player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        
        layer.addSublayer(playerLayer)
        
    }
    
    required init?(coder: NSCoder) {
        self.previewLength = 15
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
}

struct Ads_Previews: PreviewProvider {
    static var previews: some View {
        Ads()
    }
}
