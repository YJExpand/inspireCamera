//
//  ICHomeCell.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/12/7.
//

import SwiftUI
import SDWebImageSwiftUI

struct ICHomeCell: View {
    
    var data : ICHomeListModel
    
    init(_ data: ICHomeListModel) {
        self.data = data
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            WebImage(url: URL(string: data.photo))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .layoutPriority(97)
                
            Text(data.title)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                .lineLimit(2)
            HStack(alignment: .bottom) {
                WebImage(url: URL(string: data.userPicUrl))
                    .resizable()
                    .frame(width: 20,height: 20)
                    .cornerRadius(10)
                
                Text(data.nickname)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            
        }.cornerRadius(8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary.opacity(0.5)))
    }
}

struct ICHomeCell_Previews: PreviewProvider {
   static let model : ICHomeListModel = {
        let model = ICHomeListModel()
        model.title = "标题aaa"
        model.nickname = "用户昵称"
        model.photo = "https://npm.elemecdn.com/ushio-api-img-moe@5.0.42/img_424_1920x1080_72_null_normal.jpg"
        return model
    }()
    static var previews: some View {
        ICHomeCell(self.model)
    }
}
