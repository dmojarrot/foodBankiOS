//
//  WhoWeAre.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 16/10/21.
//

import SwiftUI

import WebKit

struct WhoWeAre: View {
    
    var isSheetPresented: Bool = false
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            WebView(url: URL(string: "https://bdalimentos.org/nosotros/"), onError: {error in
                print("Error: ", error.description)
            })
        }.navigationTitle("¿Quienes Somos?")
        
    }
}

struct WhoWeAre_Previews: PreviewProvider {
    static var previews: some View {
        WhoWeAre()
    }
}
