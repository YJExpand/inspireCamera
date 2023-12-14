//
//  Tabbar.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/12/6.
//

import SwiftUI

struct Tabbar: View {
    
    @Binding var currentSelected: Tab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases,id: \.self) { tabItem in
                Button {
                    currentSelected = tabItem
                } label: {
                    Text(tabItem.text)
                        .foregroundColor(currentSelected == tabItem ? .black : .gray)
                        .frame(maxWidth: .infinity)
                }.padding()
            }
        }.frame(maxHeight: .infinity,alignment: .bottom)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        @State var currentSelectd: Tab = .Home
        Tabbar(currentSelected: $currentSelectd)
    }
}
