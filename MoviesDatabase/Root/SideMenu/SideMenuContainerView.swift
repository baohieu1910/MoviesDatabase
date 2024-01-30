//  SideMenuContainerView
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import SwiftUI

struct SideMenuContainerView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)

    // Private variable
    @StateObject private var vm: SideMenuContainerVM = SideMenuContainerVM()
    @State private var fullScreen: SideMenuContainerVM.Fullscreen?
    
    
    var body: some View {
        contentView
            .onReceive(vm.$fullScreen) { identifier in
                self.fullScreen = identifier
            }
            .fullScreenCover(item: $fullScreen) { identifier in
                // Add your full-screen cover view here if needed
            }
    }
}

// MARK: - Private functions
private extension SideMenuContainerView {
    @ViewBuilder var contentView: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

// MARK: - SideMenuContainerView's Preview
//struct SideMenuContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuContainerView()
//    }
//}
