//
//  LandingPage.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct LandingPage: View{
    var body: some View{
        VStack {
            ZStack{
                Color("greenBackground").ignoresSafeArea()
                Image("logo").resizable().aspectRatio(contentMode: .fill).padding(.bottom, 82.0).frame(width: 280, height: 160, alignment: .center)}
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
