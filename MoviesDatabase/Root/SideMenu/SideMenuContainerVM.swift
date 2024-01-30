//  SideMenuContainerVM
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import Foundation

final public class SideMenuContainerVM: ObservableObject {
    enum Fullscreen: Identifiable {
        var id: String {
            switch self {
            default:
                return ""
            }
        }
    }
    
    // Public variable
    @Published var fullScreen: Fullscreen?

    // Private variable

    // Init
    init() {
        
    }
}

// MARK:- Public functions
public extension SideMenuContainerVM {
    
}

// MARK:- Private functions
private extension SideMenuContainerVM {
    
}
