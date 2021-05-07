//
//  coffee_run_coreApp.swift
//  coffee-run-core
//
//  Created by Moses Kang on 4/20/21.
//

import SwiftUI

@main
struct coffee_run_coreApp: App {
        
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
