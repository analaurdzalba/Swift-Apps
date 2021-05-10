//
//  DataView.swift
//  App01-MisDatos
//
//  Created by Ana Laura Rodriguez on 19/02/21.
//

import SwiftUI

struct DataView: View {
    
    var texto: String = "Hola"
    var imagen: String = "person.crop.circle.fill"
    var body: some View {
        HStack {
            Image(systemName: imagen)
                .font(.title)
                .foregroundColor(.gray)
            Text(texto)
                .font(.Merriweather(size: 23))
                .padding()
            }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
