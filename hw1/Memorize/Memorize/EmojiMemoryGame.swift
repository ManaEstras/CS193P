//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mana Young on 2020/5/31.
//  Copyright © 2020 estras. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private var emoji_count: Int = 0
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojisCountCandidate = [2, 3, 4, 5]
        let emojisCount = emojisCountCandidate.randomElement()!
        let emojis: Array<String> = Array(["👻", "🎃", "🕷", "🍙", "🍆"].shuffled().prefix(emojisCount))
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
    // MARK:  - Access to the model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card:card)
    }
    
    func showFontBasedOnLen() ->  Font{
        let len = model.showNumOfCards()
        if (len == 5) {
            return Font.body
        } else{
            return Font.largeTitle
        }
    }
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
