//
//  ICHomeView.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/11/27.
//

import SwiftUI
import WaterfallGrid

struct ICHomeView: View {
    
    @ObservedObject var homeViewModel : ICHomeListViewModel = ICHomeListViewModel()
    
    init() {
        homeViewModel.requestList()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                WaterfallGrid(homeViewModel.dataSources,id: \.id) { data in
                    ICHomeCell(data)
                }.gridStyle(columns: 2)
            }.padding(5)
        }
        
    }
}

struct ICHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ICHomeView()
    }
}
