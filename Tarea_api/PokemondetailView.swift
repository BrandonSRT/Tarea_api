//
//  PokemondetailView.swift
//  Tarea_api
//
//  Created by user203110 on 9/19/21.
//

import SwiftUI

struct PokemondetailView: View {
    @EnvironmentObject var appInfo: AppInformation
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(appInfo.id)+" "+appInfo.name)
                .font(.title)
            Text("Altura = "+String(appInfo.height)+"M")
            Text("Peso = "+String(appInfo.weight)+"KG")
            
            Button(action: { appInfo.appPage = 0}) {
                Text("Volver a la lista")
            }
                
        
        }
    }
}

struct PokemondetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemondetailView()
    }
}
