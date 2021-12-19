//
//  DrawView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/24.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    @State private var canvasView: PKCanvasView = PKCanvasView()
    var body: some View {
        CanvasView(canvasView: self.$canvasView)
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        if let window = UIApplication.shared.windows.first {
            if let toolPicker = PKToolPicker.shared(for: window) {
                toolPicker.addObserver(canvasView)
                toolPicker.setVisible(true, forFirstResponder: canvasView)
                canvasView.becomeFirstResponder()
            }
        }
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
