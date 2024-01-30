//
//  People.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import Foundation

struct People: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var knownFor: String?
    var biography: String?
    var birthday: String?
    var placeOfBirth: String?
    var profilePath: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case knownFor = "known_for_department"
        case biography
        case birthday
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
    
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w45"
        static let largeImageSize = "w500"
        static let noProfileImage = "https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-4-user-grey-d8fe957375e70239d6abdd549fd7568c89281b2179b5f4470e2e12895792dfa5.svg"
    
    }
    
    init() {
        id = 117642
        name = "Jason Momoa"
        knownFor = "Acting"
        biography = "Joseph Jason Namakaeha Momoa (born August 1, 1979) is an American actor and filmmaker. He made his acting debut as Jason Ioane on the syndicated action drama series Baywatch: Hawaii (1999–2001), which was followed by his portrayal of Ronon Dex on the Syfy science fiction series Stargate Atlantis (2005–2009), Khal Drogo in the first two seasons of the HBO fantasy drama series Game of Thrones (2011–2012), Declan Harp on the Discovery Channel historical drama series Frontier (2016–2018), and Baba Voss on the Apple TV+ science fiction series See (2019–present). Momoa was featured as the lead of the two lattermost series.\n\nSince 2016, Momoa portrays Arthur Curry / Aquaman in the DC Extended Universe (DCEU), headlining the eponymous 2018 film and its 2023 sequel. Momoa also played Duncan Idaho in the 2021 film adaptation of the science fiction novel Dune.\n\nDescription above from the Wikipedia article Jason Momoa, licensed under CC-BY-SA, full list of contributors on Wikipedia."
        birthday = "1979-08-01"
        placeOfBirth = "Honolulu, Hawaii, USA"
        profilePath = "/6dEFBpZH8C8OijsynkSajQT99Pb.jpg"
    }
    
    func getPeopleImage() -> String {
        if let profilePath = self.profilePath {
            return Constants.baseImageUrl + Constants.largeImageSize + profilePath
        } else {
            return Constants.noProfileImage
        }
    }
}
