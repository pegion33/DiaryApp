//
//  LoginView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 12/12/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        ZStack {
            if (viewModel.signedIn) {
                ContentView()
                    .environmentObject(viewModel)
            }
            else {
                SignInView()
                    .environmentObject(viewModel)
            }
        }
        .onAppear(perform: {
            viewModel.signedIn = viewModel.isSignedIn
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
