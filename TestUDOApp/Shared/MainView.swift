//
//  MainView.swift
//  TestUDOApp
//
//  Created by Thomas Cowern on 6/27/24.
//

import SwiftUI
import Alamofire

struct MainView: View {
    
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
           List(viewModel.messages, id: \.self) { message in
               Text(message)
           }
           
           HStack {
               TextField("Type a message", text: $viewModel.inputMessage)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               Button(action: {
                   viewModel.sendMessage()
               }) {
                   Text("Send")
               }
               .padding()
           }
       }
    }
    
    func sendMessageToChatGPT(message: String, completion: @escaping (String?) -> Void) {
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
        let parameters: [String: Any] = [
            "model": "gpt-4",  // or "gpt-3.5-turbo"
            "messages": [
                ["role": "user", "content": message]
            ]
        ]
        
        AF.request("https://chatgpt.com/g/g-TBfrOt1w9-charlotte-udo", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let choices = json["choices"] as? [[String: Any]], let message = choices.first?["message"] as? [String: Any], let content = message["content"] as? String {
                    completion(content)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }

}

#Preview {
    MainView()
}
