//
//  StudentView.swift
//  CoreDataProject
//
//  Created by Peter Molnar on 06/02/2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct StudentView: View {
    
    let students = [
        Student(name: "Harry Potter"),
    Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
