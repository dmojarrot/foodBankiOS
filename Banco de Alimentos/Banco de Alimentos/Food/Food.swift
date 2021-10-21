//
//  RegisterViews.swift
//  Banco de Alimentos
//
//  Created by Team2 on 01/09/21.
//

import SwiftUI
import MapKit
import CoreLocation



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
    @State var quantity: String =  ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    var body: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("¿Cuanta cantidad de comida quieres donar?")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                TextField("Escribe la cantidad en gramos", text: $quantity)
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
    @StateObject var locationManager = LocationManager()
    var body: some View{
        
        VStack(alignment: .center) {
            Text("Selecciona el centro de acopio mas cercano a ti")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .multilineTextAlignment(.center)
            
            ScrollView{
                VStack{
                    Button {
                        openMapForPlace(latitude: 20.656160, longitude: -103.355370, name: "Banco Diocesano de Alimentos Guadalajara")
                        
                    } label: {
                        Image("collectionCenter-1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        
                        
                    }
                    
                    Text("Banco Diocesano de Alimentos Guadalajara")
                    Text("\(String(format: "%.2f",distanceTwoPoints(latitudePlace: 20.656160, longitudePlace: -103.355370))) KM de tu ubicación actual")
                        .foregroundColor(Color("greenBackground"))
                        .padding(.bottom, 10)
                }
                
                VStack{
                    
                    Button {
                        openMapForPlace(latitude: 20.480020, longitude: -103.454320, name: "Centro de acopio Casa CEM")
                        
                    } label: {
                        Image("collectionCenter-2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        
                        
                    }
                    Text("Centro de acopio Casa CEM")
                    Text("\(String(format: "%.2f", distanceTwoPoints(latitudePlace: 20.480020, longitudePlace: -103.454320))) KM de tu ubicación actual")
                        .foregroundColor(Color("greenBackground"))
                        .padding(.bottom, 10)
                }
                
                VStack{
                    
                    Button {
                        openMapForPlace(latitude: 20.714560, longitude: -103.368240, name: "Albergue Fray Antonio Alcalde")
                        
                        
                        
                    } label: {
                        Image("collectionCenter-3")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        
                    }
                    Text("Albergue Fray Antonio Alcalde")
                    Text("\(String(format: "%.2f", distanceTwoPoints(latitudePlace: 20.714560, longitudePlace: -103.368240))) KM de tu ubicación actual")
                        .foregroundColor(Color("greenBackground"))
                        .padding(.bottom, 10)
                }
                
                
                VStack{
                    
                    Button {
                        openMapForPlace(latitude: 20.685880, longitude: -103.347800, name: "Banco de Alimentos Nayarit A.C")
                        
                    } label: {
                        Image("collectionCenter-4")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        
                    }
                    
                    Text("Banco de Alimentos Nayarit A.C")
                    Text("\(String(format: "%.2f", distanceTwoPoints(latitudePlace: 20.685880, longitudePlace: -103.347800))) KM de tu ubicación actual")
                        .foregroundColor(Color("greenBackground"))
                        .padding(.bottom, 10)
                }
                
                VStack{
                    
                    Button {
                        openMapForPlace(latitude: 20.662460, longitude: -103.341530, name: "Amigos de Juanita y Fernando A.C.")
                        
                        
                    } label: {
                        Image("collectionCenter-5")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .shadow(color: .black, radius: 0.4, y: 0.2)
                        
                        
                        
                    }
                    
                    Text("Amigos de Juanita y Fernando A.C.")
                    Text("\(String(format: "%.2f", distanceTwoPoints(latitudePlace: 20.662460, longitudePlace: -103.341530))) KM de tu ubicación actual")
                        .foregroundColor(Color("greenBackground"))
                        .padding(.bottom, 30)
                    
                }
                
                
                
            }.padding(.horizontal, 20)
            
        }
    }
    func openMapForPlace(latitude: Double, longitude: Double, name: String) {
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }
    
    func distanceTwoPoints(latitudePlace: Double, longitudePlace: Double) -> Double{
        CLLocationManager().requestWhenInUseAuthorization()
        var latitude: String {
            return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
        }
        
        var longitude: String {
            return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
        }
        
        let firstLocation = CLLocation(latitude:Double(latitude)!, longitude: Double(longitude)!)
        
        let secondLocation = CLLocation(latitude: Double(latitudePlace), longitude: Double(longitudePlace))
        
        let distance = firstLocation.distance(from: secondLocation) / 1000
        
        return distance
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
