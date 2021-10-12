//
//  Home.swift
//  Banco de Alimentos
//
//  Created by Team2 on 06/09/21.
//

import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white)]
    }
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection){
            Profile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }
                .tag(1)
            
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(2)
            
            Ads()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Ads")
                }
                .tag(3)
            
            Food()
                .tabItem {
                    Image("restaurantLogo")
                    Text("Comida")
                }
                .tag(4)
            
            Donate()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Donar")
                }
                .tag(4)
        }.accentColor(Color("greenBackground"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
