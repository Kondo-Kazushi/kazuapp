//
//  ScribbleView.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI
import PencilKit

struct ScribbleView: View {
    @State private var canvasView: PKCanvasView = PKCanvasView()
    var body: some View {
        CanvasView(canvasView: self.$canvasView)
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
