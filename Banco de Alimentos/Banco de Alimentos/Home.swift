//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Text("")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Ads")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Food")
                }
            
            Text("")
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Donate")
                }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
