//
//  ContentView.swift
//  Shared
//
//  Created by youngho joo on 2021/11/22.
//

import SwiftUI

struct ContentView: View {
    @State var data: [User] = []
    
    var body: some View {
        VStack {
            ForEach(data, id:\.id) { user in
                Label(user.name, systemImage: "person")
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        
        .onAppear {
            Network.shared.connect(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
            do {
                try self.data = JSONDecoder().decode([User].self, from: json.data(using: .utf8)!)
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
