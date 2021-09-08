//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by user195826 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white), ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.bottom)
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.clear, Color(red: 2/255, green: 32/255, blue: 32/255)]), startPoint: .center,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack{
                        NavigationLink(
                            destination: Profile(),
                            label: {
                                Label("Mi perfil", systemImage: "person.crop.circle")
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color.white))
                                
                                
                            }).padding(.top, 30).padding(.horizontal, 90)
                    }
                    
                    
                }.navigationTitle("Bienvenido")
            }
            
        }
        
    }
}




struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        HiUser()
    }
}





