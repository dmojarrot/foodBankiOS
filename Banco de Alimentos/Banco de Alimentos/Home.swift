//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.bottom)
            ScrollView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
