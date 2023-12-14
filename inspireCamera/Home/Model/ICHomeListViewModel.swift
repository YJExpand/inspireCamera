//
//  ICHomeListViewModel.swift
//  inspireCamera
//
//  Created by Sir 姚 on 2023/12/14.
//

import Combine
import HandyJSON

class ICHomeListModel: HandyJSON{
    
    var id: Int64 = 0
    
    var title : String = ""
    
    var nickname : String = ""
    
    var userPicUrl : String = ""
    
    var photo : String = ""
    
    required init() {}
}

class ICHomeListViewModel : ObservableObject{
    
    @Published private(set) var dataSources = [ICHomeListModel]()
    
    func requestList(){
        ICNetworkManager.default.request(method: .GET, urlString: "http://rap2api.taobao.org/app/mock/315810/api/homeList") { result in
            guard let array = result as? NSArray else { return }
            guard let datas = [ICHomeListModel].deserialize(from: array) as? [ICHomeListModel] else { return }
            self.dataSources = datas
            self.objectWillChange.send()
        } failBlock: { error in
            
        }

    }
}
