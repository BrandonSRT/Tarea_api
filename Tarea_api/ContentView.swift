//
//  ContentView.swift
//  api
//
//  Created by user203110 on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var results = [MyResult]()
    @EnvironmentObject var appInfo: AppInformation
    
    var body: some View {
        if appInfo.appPage == 0{
            List(results, id: \.id) { item in
               VStack(alignment: .leading) {
                   Text(item.name)
                }
               .onTapGesture {
                details(pokename: item.name)
                appInfo.appPage = 1
               }
            }.onAppear(perform: loadData)
        } else{
            PokemondetailView()
        }

       
        }
    

    
    func details(pokename:String){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/"+pokename) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        // The shared singleton session object.
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokedetailFact.self, from: data) {
                    DispatchQueue.main.async {
                        print(response.name)
                        print(response.height)
                        print(response.weight)
                        print(response.id)
                        appInfo.name = response.name
                        appInfo.height = response.height
                        appInfo.weight = response.weight
                        appInfo.id = response.id
                        
                    }
                    return
                }

            }
        
    }.resume()
        
        //dpsvr
        
    }
    
    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            print("Your API end point is Invalid")
            return
        }
    let request = URLRequest(url: url)
    // The shared singleton session object.
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(PokeFact.self, from: data) {
                DispatchQueue.main.async {
                    self.results = response.results

                }
                return
            }

        }

        
    }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class AppInformation: ObservableObject{
    @Published var appPage = 0
    @Published var name = ""
    @Published var height = 0
    @Published var weight = 0
    @Published var id = 0
}
