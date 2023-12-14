//
//  MainTabView.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/11/27.
//

import SwiftUI

struct MainTabView: View {
    
    @State var currentSelectd: Tab = .Home
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                switch currentSelectd {
                case .Home:
                    ICHomeView().frame(height: geometry.size.height - 44)
                case .Carmera:
                    ICCarmeraView().frame(height: geometry.size.height - 44)
                case .Me:
                    ICMeView().frame(height: geometry.size.height - 44)
                }
                Tabbar(currentSelected: $currentSelectd)
            }
            
        }
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
