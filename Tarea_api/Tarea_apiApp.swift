//
//  Tarea_apiApp.swift
//  Tarea_api
//
//  Created by user203110 on 9/18/21.
//

import SwiftUI

@main
struct Tarea_apiApp: App {
    @StateObject var appInfo = AppInformation()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appInfo)
        }
    }
}
