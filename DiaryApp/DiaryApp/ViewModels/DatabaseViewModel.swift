//
//  DatabaseViewModel.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 14/12/21.
//

import Foundation
import Firebase
import FirebaseAuth


class DatabaseViewModel: ObservableObject {
    
    @Published var list = [DiaryEntry]()
    let db = Firestore.firestore()
    let userId = Auth.auth().currentUser?.uid
    
    func addData(title: String, description: String, date: String) {
        db.collection(userId ?? "m")
            .addDocument(data: ["title": title, "description": description, "date": date]){error in
                if (error == nil) {
                    self.getData()
                }
            }
    }
    
    func getData() {
        db.collection(userId ?? "m").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map {d in
                            return DiaryEntry (id: d.documentID,
                                               title: d["title"] as? String ?? "",
                                               description: d["description"] as? String ?? "",
                                               date: d["date"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
}
