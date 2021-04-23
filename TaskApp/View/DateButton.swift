//
//  DateButton.swift
//  TaskApp
//
//  Created by Илья Подлесный on 23.04.2021.
//

import SwiftUI

struct DateButton: View {
    var title : String
    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        Button(action: {homeData.updateDate(value: title)}, label: {
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    
                    
                    homeData.checkDate() == title ?
                        LinearGradient(gradient: .init(colors: [.orange, .pink]), startPoint: .leading, endPoint: .trailing)
                        : LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}
