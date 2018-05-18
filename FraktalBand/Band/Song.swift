//
//  Song.swift
//  Fraktal Band
//
//  Created by Anton Siliuk on 09.05.2018.
//  Copyright © 2018 Anton Siliuk. All rights reserved.
//

import Foundation

struct Song {

    enum Genre {
        case drama
        case rockNroll
        case pop
        case punk
        case filipKirkorov
    }
    typealias Lyrics = [String]

    let lyrics: Lyrics
    let genre: Genre
}

extension Song {
    static let blueMood = Song(
        lyrics: Song.Lyrics(lyrics: """
            Цвет настроения синий. Внутри Martini, а в руках бикини.
            Под песню "Синий иней" она так чувствует себя Богиней.
            Цвет настроения синий. Внутри Martini, а в руках бикини.
            Под песню "Синий иней" она так чувствует себя Богиней.
            """
        ),
        genre: .filipKirkorov
    )
}
