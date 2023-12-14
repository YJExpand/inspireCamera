//
//  TabModel.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/11/27.
//

import Foundation
import SwiftUI

enum Tab: CaseIterable {
    case Home
    case Carmera
    case Me
    
    var text: String{
        switch self {
        case .Home:
            return "首页"
        case .Carmera:
            return "相机"
        case .Me:
            return "我的"
        }
    }
    
    var icon: String{
        switch self {
        case .Home:
            return ""
        case .Carmera:
            return ""
        case .Me:
            return ""
        }
    }
    
}
