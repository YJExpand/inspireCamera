//
//  ICResponeModel.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/12/14.
//

import HandyJSON

class ICResponeModel: HandyJSON{
    var data : Any?
    var code : Int = 200
    var message : String?
    
    required init() {
        
    }
}
