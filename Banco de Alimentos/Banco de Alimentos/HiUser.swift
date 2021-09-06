//
//  HiUser.swift
//  Banco de Alimentos
//
//  Created by user195826 on 9/6/21.
//

import SwiftUI

struct HiUser: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("User profile")
                .padding(20)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray))
                .padding(.horizontal, 20)
            Text("Payment Method")
                .padding(20)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray))
                .padding(.horizontal, 20)
            Text("Help")
                .padding(20)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray))
                .padding(.horizontal, 20)
            Spacer()
        }.navigationTitle("Hola (Usuario)")
    }
}

struct HiUser_Previews: PreviewProvider {
    static var previews: some View {
        HiUser()
    }
}
