//  SideMenuView
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import SwiftUI

struct SideMenuView: View {
    @Environment(\.presentationMode) private var presentationMode

    // Private variable
    @StateObject private var vm: SideMenuVM = SideMenuVM()
    @State private var fullScreen: SideMenuVM.Fullscreen?
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
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
private extension SideMenuView {
    @ViewBuilder var contentView: some View {
        HStack {
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .blue.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        rowView(isSelected: selectedSideMenuTab == row.rawValue, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    Color.white
                )
            }
            
            
            Spacer()
        }
        .background(.clear)
    }
    
    func rowView(isSelected: Bool, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle()
                        .fill(isSelected ? .blue : .white)
                        .frame(width: 5)
                    
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .blue.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }
}

// MARK: - SideMenuView's Preview
//struct SideMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuView()
//    }
//}
