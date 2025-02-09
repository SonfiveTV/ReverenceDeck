--- STEAMODDED HEADER
--- MOD_NAME: Reverence Deck
--- MOD_ID: ReverenceDeck
--- MOD_AUTHOR: [Sonfive]
--- MOD_DESCRIPTION: Adds a deck made of nothing but Silver Seals!
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = "reverence",
    px = 71,
    py = 95,
    path = "reverence.png"
}

SMODS.Back{
    name = "reverence",
    key = "reverence",
    atlas = "reverence",
    pos = {x = 0, y = 0},
    config = {},
    loc_txt = {
        name ="Reverence Deck",
        text={
            "All cards have ",
            "a {C:dark_edition}Silver Seal{}",
        },
    },
    apply = function(self)
        G.GAME.modifiers.poke_force_seal = "poke_silver"
    end,
}


----------------------------------------------
------------MOD CODE END----------------------