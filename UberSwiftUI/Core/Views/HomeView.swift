//
//  HomeView.swift
//  UberSwiftUI
//
//  Created by Deniz Ata Eş on 14.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
