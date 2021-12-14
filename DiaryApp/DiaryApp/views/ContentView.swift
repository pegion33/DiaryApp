//
//  ContentView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 11/12/21.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth

struct MenuContent: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        List {
            Text("Sign Out").onTapGesture {
                viewModel.signOut()
                SwitchView.goToLoginView(viewModel: viewModel)
            }
        }
    }
}


struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .environmentObject(viewModel)
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}


struct ContentView: View {
    @ObservedObject var dataBaseModel = DatabaseViewModel()
    @State var menuOpen: Bool = false
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        let width:CGFloat=35
        let heigth:CGFloat=35
        ZStack {
            if (!self.menuOpen) {
                VStack {
                    HStack {
                        Button(action: {
                            self.openMenu()
                        }, label: {
                            Image("menuicon")
                                .resizable()
                                .frame(width: width, height: heigth)
                        })
                        Spacer()
                        Button(action: {
                            SwitchView.goToShowCalanderView(viewModel: viewModel)
                        }, label: {
                            Image("calandericon")
                                .resizable()
                                .frame(width: width, height: heigth)
                                .padding()
                        })
                        Button(action: {
                            dataBaseModel.list.sort {
                                $0.date<$1.date
                            }
                        }, label: {
                            Image("sorticon")
                                .resizable()
                                .frame(width: width, height: heigth)
                                .padding()
                        })
                    }
                    Spacer()
                    Button (action: {
                        SwitchView.goToDiaryEntryView(viewModel: viewModel)
                    }, label: {
                        Image("addicon")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 1) {
                        ForEach(dataBaseModel.list) { diaryEntry in
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
                                SwitchView.goToShowDiaryEntry(title: diaryEntry.title,
                                                              description: diaryEntry.description,
                                                              date: diaryEntry.date,
                                                              viewModel: viewModel)
                            }
                            
                        }
                    }
                }
                .frame(width: 390, height: 570)
            }
            
            SideMenu(width: 270, isOpen: self.menuOpen, menuClose: self.openMenu)
                .environmentObject(viewModel)
        }
        .background(
            Image("backgound5")
        )
    }
    
    func openMenu() {
            self.menuOpen.toggle()
    }
    
    init() {
        dataBaseModel.getData()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
