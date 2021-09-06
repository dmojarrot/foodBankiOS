//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 06/09/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Profile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Ads()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Ads")
                }
            
            Food()
                .tabItem {
                    Image("restaurant_black_24dp")
                    Text("Food")
                }
            
            Donate()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Donate")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
