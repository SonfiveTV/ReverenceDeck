--- STEAMODDED HEADER
--- MOD_NAME: Reverence Deck
--- MOD_ID: ReverenceDeck
--- MOD_AUTHOR: [Sonfive]
--- MOD_DESCRIPTION: Adds a deck made of nothing but Silver Seals!
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = "sleeves",
    px = 73,
    py = 95,
    path = "sleeves.png"
}


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



if CardSleeves then

    CardSleeves.Sleeve {
        name = "reverencesleeve",
        key = "reverencesleeve",
        atlas = "sleeves",
        pos = { x = 0, y = 0 },
        config = {},
        unlocked = true,
        local_vars = function(self)
            local key, vars

            if self.get_current_deck_key() ~= "b_reve_reverence" then
                key = "reverencecsleeve"
                if self.get_current_deck_key() == "b_poke_obituarydeck" then
                    key = self.key.."reverencecsleeve_obit"
                end
            else
                key = self.key.."reverencecsleeve_alt"
            end

            return { key = key, vars = vars }
        end,
        apply = function(self)
            if self.get_current_deck_key() ~= "b_reve_reverence" then            
                if self.get_current_deck_key() == "b_poke_obituarydeck" then
--                                                                               insert logic to apply seals to only half the deck here

                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit + 5
                        return true 
                    end }))
                else
                    G.GAME.modifiers.poke_force_seal = "poke_silver" 
                end
            else
                G.E_MANAGER:add_event(Event({func = function()
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                    return true end }))
                
            end
        end,
    }
end


----------------------------------------------
------------MOD CODE END----------------------