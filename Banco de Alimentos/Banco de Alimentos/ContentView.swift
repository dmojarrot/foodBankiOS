//
//  ContentView.swift
//  Banco de Alimentos
//
//  Created by Team2 on 29/08/21.
//

import SwiftUI



struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("greenTitle"))]
    }
    var body: some View {
        NavigationView{
                MainView()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
