//
//  WhoWeAre.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 16/10/21.
//

import SwiftUI

import WebKit

struct WhoWeAre: View {
    @State var isLoading: Bool = true
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            WebView(url: URL(string: "https://bdalimentos.org/nosotros/"), onError: {error in
                print("Error: ", error.description)
            })
            if isLoading{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("greenBackground"))).scaleEffect(2)
            }
        }.navigationTitle("¿Quiénes somos?").onAppear{loadingBarTimer()}
        
    }
    
    func loadingBarTimer(){
        if isLoading{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                isLoading = false
            }
        }
    }
    
}

struct WhoWeAre_Previews: PreviewProvider {
    static var previews: some View {
        WhoWeAre()
    }
}
