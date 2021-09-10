//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by user195826 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.white, Color.gray]), startPoint: .bottom,  endPoint: .top).edgesIgnoringSafeArea(.all))
                ScrollView{
                    VStack{
                        NavigationLink(
                            destination: Profile(),
                            label: {
                                Label("Mi perfil", systemImage: "person.crop.circle")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color("greenBackground")))
                                
                                
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





