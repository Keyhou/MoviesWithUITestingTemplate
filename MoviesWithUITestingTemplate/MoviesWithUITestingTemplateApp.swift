//
//  MoviesWithUITestingTemplateApp.swift
//  MoviesWithUITestingTemplate
//
//  Created by Julie Collazos on 26/01/2023.
//

import SwiftUI

@main
struct MoviesWithUITestingTemplateApp: App {
    @StateObject var moviesData = MoviesData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(moviesData)
        }
    }
}
