//
//  Routing.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import SwiftUI

public struct PushView<Label: View>: View {
    private let destination: AnyView
    private let label: () -> Label
    
    public init(destination: AnyView, label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View{
        NavigationLink(destination: destination) {
            label()
        }.isDetailLink(false)
    }
}

public struct PopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public var body: some View{
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .frame(width: 25, height: 20)
                .foregroundColor(.lightYellow)
        }
    }
}
