//
//  DataBaseViewModelForCalander.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 14/12/21.
//

import Foundation
import Firebase
import FirebaseAuth


class DataBaseViewModelForCalander: ObservableObject {
    
    @Published var list = [DiaryEntry]()
    let db = Firestore.firestore()
    let userId = Auth.auth().currentUser?.uid
    
    func getData(date: String) {
        list.removeAll()
        db.collection(userId ?? "m").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
//                        self.list = snapshot.documents.map {d in
//                            if d["date"] as? String ?? "" == date {
//                                return DiaryEntry (id: d.documentID,
//                                                   title: d["title"] as? String ?? "",
//                                                   description: d["description"] as? String ?? "",
//                                                   date: d["date"] as? String ?? "")
//                            }
//                        }
                        
                        for d in snapshot.documents {
                            if d["date"] as? String ?? "" == date {
                                self.list.append(DiaryEntry (id: d.documentID,
                                                        title: d["title"] as? String ?? "",
                                                        description: d["description"] as? String ?? "",
                                                        date: d["date"] as? String ?? ""))
                            }
                        }
                    }
                }
            }
        }
    }
    
}
