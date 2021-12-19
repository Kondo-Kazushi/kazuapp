//
//  Sharesheet.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/24.
//

import SwiftUI

struct ShareTextView: View {
    @State private var showActivityView: Bool = false
    @State private var shareItem: String = ""
    
    var body: some View {
        VStack{
            TextField("type something...", text: $shareItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(16.0)
            Button(action: {self.showActivityView = true})
            {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .sheet(isPresented: self.$showActivityView) {
                ShareSheet(text: $shareItem)
            }
        }
        .fixedSize()
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    @Binding var text: String
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityItems: [Any] = [text]
        
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}
