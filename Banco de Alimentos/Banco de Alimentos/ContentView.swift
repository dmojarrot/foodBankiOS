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
    var body: some View{
        
        NavigationView {
<<<<<<< HEAD

            Profile()

=======
            ZStack{
                Color("background").edgesIgnoringSafeArea(.bottom)
                Acknowledgment()

            }
>>>>>>> 724aabf788f1d86a61289e0b6aa38dd9fa1b56a7
        }
        
    }
}
