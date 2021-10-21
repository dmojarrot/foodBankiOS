//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI



struct Food: View {
    @State var other: String = ""
    @State var isFoodActive = false
    @State var foodMethod = true
    
    var body: some View{
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView{
                    Spacer(minLength: 15)
                    HStack{
                        
                        Spacer()
                        
                        Button {
                            foodMethod = true
                        } label: {
                            Text("Delivery").foregroundColor(foodMethod ? Color("redColor") : .gray).fontWeight(.bold)
                        }
                        
                        
                        Spacer()
                        
                        Button {
                            foodMethod = false
                        } label: {
                            Text("Pickup").foregroundColor(foodMethod ? .gray : Color("redColor")).fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        
                    }
                    
                    Spacer(minLength:20)
                    
                    if foodMethod == true{
                        Delivery()
                    }else{
                        CollectionCenter()
                    }
                    
                }.navigationBarTitle("Comida")
            }
        }
        
    }
    
}

struct Delivery: View{
    @State var streetNumber: String =  ""
    @State var city: String =  ""
    @State var section: String =  ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    var body: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("¿Cuanta cantidad de comida quieres donar?")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                TextField("Escribe la cantidad en gramos", text: $streetNumber)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 0.4, y: 0.2)
            }
            
            Text("¿Qué tipo de comida es?")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top, 10)
                .padding(.bottom, 5)
            
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: MultipleSelectionList(),
                    label: {
                        HStack {
                            
                            Text("Seleccione el o los tipos de comida").foregroundColor(colorScheme == .dark ? Color.white : Color.black).opacity(0.25)
                            
                            
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right").foregroundColor(Color("greenBackground"))
                            
                        }.padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(UIColor.systemBackground)))
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                            .padding(.bottom, 5)
                        
                        
                        
                    })
            }
            
            
            VStack(alignment: .leading) {
                Text("Calle")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                TextField("Escribe la calle y el numero", text: $streetNumber)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 0.4, y: 0.2)
                
                
                Text("Ciudad")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                TextField("Escribe la ciudad", text: $city)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 0.4, y: 0.2)
                
                
                Text("Colonia")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                TextField("Escribe la colonia", text: $section)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 0.4, y: 0.2)
                    .padding(.bottom, 20)
                
            }
            
            Button(action: {}, label: {
                Text("Donar")
                    .foregroundColor(.white)
                    .bold()
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("greenBackground"))
                    .cornerRadius(20)
                
            }).padding(.bottom)
        }.padding(.horizontal)
        
    }
}

struct CollectionCenter: View{
    var body: some View{
        
        VStack(alignment: .leading) {
            Text("Centros de Acopio")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
            
                .padding(.bottom, 30)
                .padding(.leading, 50)
            ScrollView(.horizontal, showsIndicators: true){
                HStack{
                    Image("galeria-1")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                        .frame(width: 300, height: 300)
                        


                    Image("galeria-2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                        .frame(width: 300, height: 300)

                    Image("galeria-3")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                        .frame(width: 300, height: 300)
                    
                    Image("galeria-4")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                        .frame(width: 300, height: 300)
                    

                }.padding(.bottom)
            }
        }
    }
}



struct MultipleSelectionList: View {
    @State var items: [String] = ["Frutas","Verduras", "Cereales","Carnes rojas", "Otro tipo"]
    @State var selections: [String] = []
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.items, id: \.self) { item in
                    MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                        }
                        else {
                            self.selections.append(item)
                        }
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}



struct Food_Previews: PreviewProvider {
    static var previews: some View {
        Food()
    }
}
