//
//  ImageView.swift
//  App01-MisDatos
//
//  Created by Ana Laura Rodriguez on 19/02/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("tangyCompleta")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
