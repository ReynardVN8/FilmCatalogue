//
//  StaticAppHeader.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import SwiftUI

struct StaticAppHeader: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{
        HStack(alignment: .center){
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(.lightYellow)
            }
            Spacer()
            Text("Film Catalogue")
                .font(.largeTitle)
                .foregroundColor(.lightYellow)
                .bold()
            Spacer()
        }
            .padding(.leading, 15)
            .padding(.trailing, 40)
            .frame(height: 50)
            .background(Color.darkGreen)
            .toolbar(.hidden, for: .navigationBar)
    }
}

struct HeaderMainScreen: View {
    var body: some View {
        HStack(alignment: .center){
            Spacer()
            Text("Film Catalogue")
                .font(.largeTitle)
                .foregroundColor(.lightYellow)
                .bold()
            Spacer()
        }
            .padding(15)
            .frame(height: 50)
            .background(Color.darkGreen)
    }
}
