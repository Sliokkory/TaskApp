//
//  ContentView.swift
//  TaskApp
//
//  Created by Илья Подлесный on 23.04.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    init () {
        
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        
        Home()
    }
}
