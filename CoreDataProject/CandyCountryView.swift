//
//  CandyCountryView.swift
//  CoreDataProject
//
//  Created by Peter Molnar on 07/02/2022.
//

import SwiftUI

struct CandyCountryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                let candy5 = Candy(context: moc)
                candy5.name = "Szaloncukor"
                candy5.origin = Country(context: moc)
                candy5.origin?.shortName = "H"
                candy5.origin?.fullName = "Hungary"
                
                let candy6 = Candy(context: moc)
                candy6.name = "Smarties"
                candy6.origin = Country(context: moc)
                candy6.origin?.shortName = "UK"
                candy6.origin?.fullName = "United Kingdom"
                
                
                let candy7 = Candy(context: moc)
                candy7.name = "Smarties"
                candy7.origin = Country(context: moc)
                candy7.origin?.shortName = "USA"
                candy7.origin?.fullName = "United Stations of America"
                
                
                try? moc.save()
                
            }
        }
        
    }
}

struct CandyCountryView_Previews: PreviewProvider {
    static var previews: some View {
        CandyCountryView()
    }
}
