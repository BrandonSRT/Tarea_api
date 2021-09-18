//
//  ContentView.swift
//  api
//
//  Created by user203110 on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var results = [MyResult]()
    
    var body: some View {
        List(results, id: \.id) { item in
           VStack(alignment: .leading) {
               Text(item.name)
            }
        }.onAppear(perform: loadData)
        
        
    }
    
    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            print("Your API end point is Invalid")
            return
        }
    let request = URLRequest(url: url)
    // The shared singleton session object.
    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let data = data {
//            if let response = try? JSONDecoder().decode(PokeFact.self, from: data) {
//                DispatchQueue.main.async {
//                    self.results = response.results
//
//                }
//                return
//            }
//
//        }
        if let error = error{
            
        }
        do{
            let response = try JSONDecoder().decode(PokeFact.self, from: data!)
            for index in 0..<response.results.count{
                let name = response.results[index].name
            }
            
        } catch{
            print("error")
        }
        
        
    }.resume()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
