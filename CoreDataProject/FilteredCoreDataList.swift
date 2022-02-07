//
//  FilteredCoreDataList.swift
//  CoreDataProject
//
//  Created by Peter Molnar on 07/02/2022.
//

import SwiftUI
import CoreData

struct FilteredCoreDataList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // This is the content closure, we will call it for each element in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { listItem in
            self.content(listItem)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        // Using %K for the key
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
    
}
