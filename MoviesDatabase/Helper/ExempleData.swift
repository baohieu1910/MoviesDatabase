//
//  ExempleData.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/31/24.
//

import Foundation

struct ExampleData {
    static let movie = Movie(backdropPath: "/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg",
                             posterPath: "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
                             genreIds: [28, 12, 14],
                             id: 572802,
                             originalLanguage: "en",
                             title: "Aquaman and the Lost Kingdom",
                             releaseDate: "2023-12-20",
                             overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
                             voteAverage: 6.904,
                             voteCount: 925
    )
    
    static let people = People(id: 117642,
                               name: "Jason Momoa",
                               knownFor: "Acting",
                               biography: "Joseph Jason Namakaeha Momoa (born August 1, 1979) is an American actor and filmmaker. He made his acting debut as Jason Ioane on the syndicated action drama series Baywatch: Hawaii (1999–2001), which was followed by his portrayal of Ronon Dex on the Syfy science fiction series Stargate Atlantis (2005–2009), Khal Drogo in the first two seasons of the HBO fantasy drama series Game of Thrones (2011–2012), Declan Harp on the Discovery Channel historical drama series Frontier (2016–2018), and Baba Voss on the Apple TV+ science fiction series See (2019–present). Momoa was featured as the lead of the two lattermost series.\n\nSince 2016, Momoa portrays Arthur Curry / Aquaman in the DC Extended Universe (DCEU), headlining the eponymous 2018 film and its 2023 sequel. Momoa also played Duncan Idaho in the 2021 film adaptation of the science fiction novel Dune.\n\nDescription above from the Wikipedia article Jason Momoa, licensed under CC-BY-SA, full list of contributors on Wikipedia.",
                               birthday: "1979-08-01",
                               placeOfBirth: "Honolulu, Hawaii, USA",
                               profilePath: "/6dEFBpZH8C8OijsynkSajQT99Pb.jpg"
    )
    
    static let cast = Cast(id: 117642,
                           name: "Jason Momoa",
                           profilePath: "/6dEFBpZH8C8OijsynkSajQT99Pb.jpg",
                           character: "Arthur Curry / Aquaman"
    )
    
    static let movieDetail = MovieDetail(backdropPath: "/jXJxMcVoEuXzym3vFnjqDW4ifo6.jpg",
                                         budget: 205000000,
                                         genres: [],
                                         id: 572802,
                                         originalLanguage: "en",
                                         originalTitle: "Aquaman and the Lost Kingdom",
                                         overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
                                         posterPath: "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
                                         releaseDate: "2023-12-20",
                                         revenue: 412442014,
                                         runtime: 124,
                                         status: "Released",
                                         tagline: "The tide is turning.",
                                         title: "Aquaman and the Lost Kingdom",
                                         voteAverage: 6.995,
                                         voteCount: 1180)
}
