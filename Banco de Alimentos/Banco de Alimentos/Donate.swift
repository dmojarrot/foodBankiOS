//
//  Donation.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI
import WebKit

struct Donate: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("greenTitle"))]
    }
    var isSheetPresented: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.bottom)
                WebView(url: URL(string: "https://donaronline.org/banco-de-alimentos-guadalajara/sin-hambre-manana"), onError: {error in
                            print("Error: ", error.description)
                })
            }.navigationTitle("Donar")
        }
        
    }
}

enum MyURLError: Error{
    case invalidURL
    
    var description: String{
        switch self{
        case .invalidURL:
            return "Your URL is trash. Fix it"
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
