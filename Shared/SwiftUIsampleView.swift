//
//  SwiftUIsampleView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/24.
//

import SwiftUI

struct SwiftUIsampleView: View {
    @State private var color = Color(.green)
    @State private var speed = 50.0
    @State private var isEditing = false
    @State private var vibrateOnRing = false
    @State private var stepper = 0
    @State private var secure: String = "1234"
    var body: some View {
        VStack{
            DatePicker(selection: .constant(Date()), label: { Text("Date") })
            ColorPicker("Title", selection: $color)
            Button(action: {}) {
                Text("Button")
            }
            Menu("Menu") {
                Text("Menu Item 1")
                Text("Menu Item 2")
                Text("Menu Item 3")
            }
            Slider(value: $speed, in: 0...100, onEditingChanged: {editing in isEditing = editing} )
            Toggle(isOn: $vibrateOnRing) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            Stepper(value: $stepper, in: 0...100) {
                Text("\(stepper)")
            }
            SecureField(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/"Password"/*@END_MENU_TOKEN@*/, text: $secure)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(16.0)
        }
        .fixedSize()
    }
}

struct SwiftUIsampleView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIsampleView()
    }
}
