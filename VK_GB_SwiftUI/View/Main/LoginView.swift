//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Павел Черняев on 28.09.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var login: String = "123"
    @State var password: String = "123"
    
    @State var isUserCredsAlertShow: Bool = false
    
    @Binding var isLoginComplete: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("vk-logo")
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 50)
                        .cornerRadius(12)
                    
                    Text("вконтакте")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                Text("Для продолжения вам необходимо войти ВКонтакте")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.gray)
                
                Text("Телефон или email:")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.top, 24)
                
                TextField("", text: $login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Пароль")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.top, 8)
                
                SecureField("", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Button(action: {
                        self.verefyUserCredentials()
                    }, label: {
                        Text("Войти")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            
                    })
                    .padding(.init(top: 8,
                                   leading: 16,
                                   bottom: 8,
                                   trailing: 16))
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button(action: {
                        print("cancel")
                    }, label: {
                        Text("Отмена")
                            .font(.title3)
                    })
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(.init(top: 8,
                           leading: 8,
                           bottom: 8,
                       trailing: 8))
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $isUserCredsAlertShow, content: {
            Alert(title: Text("Incorrect user creds"),
                  message: Text("Incorrect user login or password"),
                  dismissButton: .cancel())
        })
    }
  
    //MARK:- private
    private func verefyUserCredentials() {
        if login == "123" && password == "123" {
            self.isLoginComplete = true
        } else {
            self.isUserCredsAlertShow = true
        }
        password = ""
    }
}

extension UIApplication {
    func endEditing () {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoginComplete: .constant(false))
    }
}
