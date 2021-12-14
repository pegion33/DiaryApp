//
//  ShowDiaryEntry.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 14/12/21.
//

import SwiftUI

struct ShowDiaryEntryForCalander: View {
    var title:String
    var description:String
    var date:String
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    SwitchView.goToShowCalanderView(viewModel: viewModel)
                }, label: {
                    Image("closeicon")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                })
                .padding()
                Spacer()
            }
            HStack {
                Text(date)
                    .padding()
                Spacer()
            }
            Divider()
                .padding()
            HStack {
                Text(title)
                    .bold()
                    .font(.title)
                    .padding()
                Spacer()
            }
            HStack {
                Text(description)
                    .padding()
                Spacer()
            }
            Spacer()
        }
    
    }
}

//struct ShowDiaryEntry_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDiaryEntry()
//    }
//}
