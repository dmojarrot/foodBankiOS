//
//  Donation.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI
import WebKit

struct Donate: View {
    
    @State var isLoading: Bool = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                WebView(url: URL(string: "https://donaronline.org/banco-de-alimentos-guadalajara/sin-hambre-manana"), onError: {error in
                    print("Error: ", error.description)
                })
                if isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("greenBackground"))).scaleEffect(2)
                }
            }.navigationTitle("Donar")
        }.onAppear{loadingBarTimer()}
        
    }
    
    func loadingBarTimer(){
        if isLoading{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                isLoading = false
            }
        }
    }
}

enum MyURLError: Error{
    case invalidURL
    
    var description: String{
        switch self{
        case .invalidURL:
            return "URL doesn't work:("
        }
    }
}

struct WebView: UIViewRepresentable{
    let url: URL?
    
    let onError: (MyURLError) -> Void
    
    private let webView = WKWebView()
    
    func makeUIView(context: Context) -> some UIView {
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        webView.load(url, onError: onError)
        
    }
}

extension WKWebView{
    func load(_ url: URL?, onError: (MyURLError) -> Void){
        guard let url = url else{
            return
        }
        load(.init(url: url))
        
    }
}




struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate()
    }
}
