//
//  DiaryEntryView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 12/12/21.
//

import SwiftUI

struct DiaryEntryView: View {
    @State private var date = Date()
    @State private var title:String=""
    @State private var description:String=""
    @EnvironmentObject var viewModel: AppViewModel
    let dateFormatter = DateFormatter()
    var dataBaseModel = DatabaseViewModel()
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack () {
                    Button(action: {
                        SwitchView.goToContentView(viewModel: viewModel)
                    }, label: {
                        Image("closeicon")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                    })
                    Spacer()
                    Button(action: {
                        
                        dateFormatter.dateFormat = "dd/MM/YY"
                        dataBaseModel.addData(title: title, description: description, date: dateFormatter.string(from: date))
                        SwitchView.goToContentView(viewModel: viewModel)
                        
                    }, label: {
                        Text("Save")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 75, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.green)
                            .cornerRadius(10)
                    })
                }
                .frame(height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                
                DatePicker("Date:",
                           selection: $date,
                           in: ...Date(),
                           displayedComponents: .date)
                    .frame(height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Divider()
                    .frame(width: 360, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                    .padding()
                
                ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(Color(UIColor.secondarySystemBackground))
                
                                if title.isEmpty {
                                    Text("Title")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color(UIColor.placeholderText))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                }
                                TextEditor(text: $title)
                                    .padding()
                            }
                            .frame(width: 360, height: 60)
                            .font(.body)
                
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(Color(UIColor.secondarySystemBackground))
                
                                if description.isEmpty {
                                    Text("Write Something...")
                                        .font(.body)
                                        .foregroundColor(Color(UIColor.placeholderText))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                }
                                TextEditor(text: $description)
                                    .padding()
                            }
                            .frame(width: 360, height: 500)
                            .font(.body)
                Spacer()
                
            }
            
        }
    }
}

struct DiaryEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryEntryView()
    }
}
