//
//  ShowCalanderView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 14/12/21.
//

import SwiftUI

struct ShowCalanderView: View {
    @State private var date:Date = Date()
    @EnvironmentObject var viewModel: AppViewModel
    let dateFormatter = DateFormatter()
    @ObservedObject var dataBaseModelForCalander = DataBaseViewModelForCalander()
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        SwitchView.goToContentView(viewModel: viewModel)
                    }, label: {
                        Image("closeicon")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                    })
                    .padding()
                    Spacer()
                }
                DatePicker("Date:",
                           selection: $date,
                           in: ...Date(),
                           displayedComponents: .date)
                    .frame(height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
                Button(action: {
                    dateFormatter.dateFormat = "dd/MM/YY"
                    dataBaseModelForCalander.getData(date: dateFormatter.string(from: date))
                }, label: {
                    Text("Search")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                })
                
                ScrollView {
                    VStack(spacing: 1) {
                        ForEach(dataBaseModelForCalander.list) { diaryEntry in
                            HStack {
                                Text(diaryEntry.date)
                                    .padding()
                                Divider()
                                    .padding()
                                Text(diaryEntry.title)
                                    .padding()
                                Spacer()
                            }
                            .frame(width: 370, height: 70)
                            .background(Color.green)
                            .opacity(0.5)
                            .cornerRadius(10)
                            .padding()
                            .onTapGesture {
                                SwitchView.gotToShowDiaryEntryForCalander(title: diaryEntry.title,
                                                              description: diaryEntry.description,
                                                              date: diaryEntry.date,
                                                              viewModel: viewModel)
                            }
                            
                        }
                    }
                }
                .frame(width: 390, height: 570)
                
            }
        }
    }
    init() {
        dateFormatter.dateFormat = "dd/MM/YY"
        dataBaseModelForCalander.getData(date: dateFormatter.string(from: date))
    }
}

//struct ShowCalanderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowCalanderView()
//    }
//}
