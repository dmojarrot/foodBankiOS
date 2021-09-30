//
//  FoodSelector.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 30/09/21.
//

import SwiftUI

struct FoodItems: Identifiable {
    var id = UUID()
    var name: String
}

extension FoodItems {
    static func dummyData() -> [FoodItems] {
        let items = ["Frutas","Verduras", "Cereales","Carne roja", "Otra tipo"]
        
        var array = [FoodItems]()
        
        for item in items {
            let foodItems = FoodItems(name: item)
            array.append(foodItems)
        }
        
        return array
    }
}

struct MultiSelectRow: View {
    var foodItems: FoodItems
    
    @Binding var selectedItems: Set<UUID>
    
    var isSelected: Bool{
        selectedItems.contains(foodItems.id)
    }
    
    var body: some View{
        HStack{
            Text(self.foodItems.name)
                .font(.title)
                .fontWeight(.light)
            Spacer()
            if self.isSelected{
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
            }
        }
        .onTapGesture {
            if self.isSelected{
                self.selectedItems.remove(self.foodItems.id)
            }else{
                self.selectedItems.insert(self.foodItems.id)
            }
        }
    }
}

struct FoodSelector: View {
    var foodItemss = FoodItems.dummyData()
    @State var selectedRows = Set<UUID>()
    var body: some View{
        VStack {
            List(foodItemss, selection: $selectedRows) { foodItems in
                MultiSelectRow(foodItems: foodItems, selectedItems: $selectedRows)
            }
        }
    }
}

struct FoodSelector_Previews: PreviewProvider {
    static var previews: some View {
        FoodSelector()
    }
}
