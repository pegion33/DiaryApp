//
//  SignInView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 13/12/21.
//

import SwiftUI

struct SignInView: View {
    @State private var email=""
    @State private var password=""
    @EnvironmentObject private var viewModel: AppViewModel
    var body: some View {
        NavigationView {
            VStack {
                Image("appicon1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .padding()
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .padding()
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 150, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)
                    })
                    
                    NavigationLink("Did not register? Create Account", destination: SignUpView()
                                    .environmentObject(viewModel))
                        .padding()
                    
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Sign In")
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
