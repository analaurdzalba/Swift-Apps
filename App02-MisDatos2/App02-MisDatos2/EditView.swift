//
//  EditView.swift
//  App02-MisDatos2
//
//  Created by Ana Laura Rodriguez on 26/02/21.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var name: String
    @Binding var email: String
    @Binding var birthDate: Date
    @Binding var height: Double
    @Binding var weight: Int
    @Binding var healthIndex: Int
    var health: [String]
    
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy"
        return formatter
    }
    
    var body: some View {
        VStack {
//            Text("Mis Datos")
//                .font(.Merriweather(size: 32))
//                .foregroundColor(Color("abajo"))
            Form {
                Section {
                    VStack (alignment: .leading){
                        HStack{
                            Text("Nombre:")
                                .font(.Oswald(size: 20))
                                .foregroundColor(Color("abajo"))
                            TextField("Nombre", text: $name)
                                .font(.Oswald(size: 20))
                                .foregroundColor(Color("abajo"))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack{
                            Text("Correo:")
                                .font(.Oswald(size: 20))
                                .foregroundColor(Color("abajo"))
                            
                            TextField("Correo", text: $email)
                                .font(.Oswald(size: 20))
                                .foregroundColor(Color("abajo"))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                Section {
                    DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                        Text("\(dateFormat.string(from: birthDate))")
                            .font(.Oswald(size: 20))
                            .foregroundColor(Color("abajo"))
                    }
                }
                Section {
                    VStack{
                        Text("Estatura \(String(format: "%0.2f",height))")
                            .font(.Oswald(size: 20))
                            .foregroundColor(Color("abajo"))
                        Slider(value: $height, in: 0.6...2.6)
                            .padding(.horizontal,40)
                        HStack {
                        Text("Peso \(weight)")
                            .font(.Oswald(size: 20))
                            .foregroundColor(Color("abajo"))
                        Stepper(value: $weight, in: 40...120) {
                            Text(" ")
                                .font(.Oswald(size: 20))
                                .foregroundColor(Color("abajo"))
                        }
                        }
                        .padding(.horizontal,80)
                    }
                }
                Section{
                    VStack{
                        HStack{
                            Image(systemName: "heart.fill")
                            .foregroundColor(Color(health[healthIndex]))
                            Text(health[healthIndex])
                                .font(.Oswald(size:20))
                                .foregroundColor(Color("abajo"))
                        }
                    Picker(selection: $healthIndex, label:
                        Text("Cual es el estado de tu salud")
                        ){
                            ForEach(0..<health.count) { index in
                                Text(self.health[index])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                }
                }
            }
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                VStack {
//                    HStack {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(Color("arriba"))
//
//                Text("Cerrar")
//                    .font(.Merriweather(size: 30))
//                    .foregroundColor(Color("arriba"))
//                    }
//            }
//                .padding()
//                .background(Color("abajo"))
//                .cornerRadius(40)
//            })
//            .padding()
        }
        .navigationBarTitle("Editar - Mis Datos")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditView_Previews: PreviewProvider {
    @State static var name: String = "Ana"
    @State static var email: String = "analaurdzalba@gmail.com"
    @State static var birthDate: Date = Date()
    @State static var height: Double = 1.80
    @State static var weight: Int = 90
    @State static var healthIndex: Int = 0
    
    static var previews: some View {
        EditView(name: $name, email: $email, birthDate: $birthDate,height: $height, weight: $weight,healthIndex: $healthIndex,health:["buena","regular","mala"])
    }
}
