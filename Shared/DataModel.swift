//
//  DataModel.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import Foundation

/*#-code-walkthrough(3.dataModel)*/
class DataModel: ObservableObject {
    /*#-code-walkthrough(3.dataModel)*/
    
    /*#-code-walkthrough(3.items)*/
    @Published var items: [Item] = []
    /*#-code-walkthrough(3.items)*/
    
    init() {
        /*#-code-walkthrough(3.preloadItemsDocumentDirectory)*/
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
        /*#-code-walkthrough(3.preloadItemsDocumentDirectory)*/
        
        /*#-code-walkthrough(3.preloadItemsBundleResources)*/
        if let urls = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil) {
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
        /*#-code-walkthrough(3.preloadItemsBundleResources)*/
    }
    
    /*#-code-walkthrough(3.addItem)*/
    /// Adds an item to the data collection.
    func addItem(_ item: Item) {
        items.insert(item, at: 0)
    }
    /*#-code-walkthrough(3.addItem)*/
    
    /*#-code-walkthrough(3.removeItem)*/
    /// Removes an item from the data collection.
    func removeItem(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
    /*#-code-walkthrough(3.removeItem)*/
}

extension URL {
    /// Indicates whether the URL has a file extension corresponding to a common image format.
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}

