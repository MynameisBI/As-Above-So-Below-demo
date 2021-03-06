return {
	levels = {
		warmUp = {
			background = 'warmUp',
			cardsNum = 2,
			baseDeck = {'b'},
			wildCards = {'f1', 'f2', 'f3', 'f4'},
			startingPoint = 10,
		},
		theBeginning = {
			background = 'theBeginning',
			cardsNum = 2,
			baseDeck = {'b'},
			wildCards = {'f1', 'f2', 'f3', 'w1', 'w2', 'w3'},
			startingPoint = 7,
		},
		mainGate = {
			background = 'mainGate',
			cardsNum = 3,
			baseDeck = {'b', 'g', 'ha'},
			wildCards = {'f1', 'f2', 'f3', 'w1', 'w2', 'w3', 'e1', 'e2', 'e3'},
			startingPoint = 5,
		},
		bridgeTown = {
			background = 'bridgeTown',
			cardsNum = 3,
			baseDeck = {'b', 'g'},
			wildCards = {'w1', 'w2', 'w3', 'a1', 'a2', 'a3', 'e1', 'e2', 'e3'},
			startingPoint = 3,
			minimumPoint = 15,
		},
		monastery = {
			background = 'monastery',
			cardsNum = 3,
			baseDeck = {'b', 'g', 'ge', 'he'},
			wildCards = {'f1', 'f2', 'f3', 'a1', 'a2', 'a3', 'e1', 'e2', 'e3'},
			startingPoint = 0,
		},
		nightTavern = {
			background = 'nightTavern',
			cardsNum = 3,
			baseDeck = {'b', 'b', 'ha', 'ch'},
			wildCards = {'f1', 'f2', 'f3', 'a1', 'a2', 'a3', 'w1', 'w2', 'w3'},
			startingPoint = 20,
		},
		theRoyalFortress	 = {
			background = 'theRoyalFortress',
			cardsNum = 4,
			baseDeck = {'b', 'g', 'ge', 'ha'},
			wildCards = {'f1', 'f2', 'f3', 'f4', 'w1', 'w2', 'w3', 'w4',
					'e1', 'e2', 'e3', 'a1', 'a2', 'a3', 'a4',
					'g', 'he', 'he', 'ch', 'ch'},
			startingPoint = 5,
			minimumPoint = 30,
		},
	},
	
	cardInfos = {
		f1 = {
			name = 'Fire 1',
			value = 1,
			group = 'element',
			type = 'fire',
			sprite = 'fire1',
		},
		f2 = {
			name = 'Fire 2',
			value = 2,
			group = 'element',
			type = 'fire',
			sprite = 'fire2',
		},
		f3 = {
			name = 'Fire 3',
			value = 3,
			group = 'element',
			type = 'fire',
			sprite = 'fire3',
		},
		f4 = {
			name = 'Fire 4',
			value = 4,
			group = 'element',
			type = 'fire',
			sprite = 'fire4',
		},

		w1 = {
			name = 'Water 1',
			value = 1,
			group = 'element',
			type = 'water',
			sprite = 'water1',
		},
		w2 = {
			name = 'Water 2',
			value = 2,
			group = 'element',
			type = 'water',
			sprite = 'water2',
		},
		w3 = {
			name = 'Water 3',
			value = 3,
			group = 'element',
			type = 'water',
			sprite = 'water3',
		},
		w4 = {
			name = 'Water 4',
			value = 4,
			group = 'element',
			type = 'water',
			sprite = 'water4',
		},

		e1 = {
			name = 'Earth 1',
			value = 1,
			group = 'element',
			type = 'earth',
			sprite = 'earth1',
		},
		e2 = {
			name = 'Earth 2',
			value = 2,
			group = 'element',
			type = 'earth',
			sprite = 'earth2',
		},
		e3 = {
			name = 'Earth 3',
			value = 3,
			group = 'element',
			type = 'earth',
			sprite = 'earth3',
		},
		e4 = {
			name = 'Earth 4',
			value = 4,
			group = 'element',
			type = 'earth',
			sprite = 'earth4',
		},

		a1 = {
			name = 'Air 1',
			value = 1,
			group = 'element',
			type = 'air',
			sprite = 'air1',
		},
		a2 = {
			name = 'Air 2',
			value = 2,
			group = 'element',
			type = 'air',
			sprite = 'air2',
		},
		a3 = {
			name = 'Air 3',
			value = 3,
			group = 'element',
			type = 'air',
			sprite = 'air3',
		},
		a4 = {
			name = 'Air 4',
			value = 4,
			group = 'element',
			type = 'air',
			sprite = 'air4',
		},

		g = {
			name = 'Gold 4',
			value = 5,
			group = 'gold',
			type = 'gold',
			sprite = 'gold',
		},
		geBo = {
			name = 'Gold Event Body',
			value = 0,
			group = 'gold',
			type = 'gold event',
			triValue = 1,
			triType = 'body',
			sprite = 'gold event body',
		},
		geSo = {
			name = 'Gold Event Soul',
			value = 0,
			group = 'gold',
			type = 'gold event',
			triValue = 1,
			triType = 'soul',
			sprite = 'gold event soul',
		},
		geSp = {
			name = 'Gold Event Spirit',
			value = 0,
			group = 'gold',
			type = 'gold event',
			triValue = 1,
			triType = 'spirit',
			sprite = 'gold event spirit',
		},
		b = {
			name = 'Black 4',
			value = 5,
			score = -5,
			group = 'black',
			type = 'black',
			sprite = 'black',
			valueTextColor = {1, 1, 1},
		},
		he = {
			name = 'Heresy',
			value = 0,
			group = 'black',
			type = 'black event',
			event = function(self, deck)
				deck.autoAddRemoveLeft = deck.autoAddRemoveLeft + 2
			end,
			sprite = 'heresy',
			valueTextColor = {1, 1, 1},
		},
		ch = {
			name = 'Charlatan',
			value = 0,
			group = 'black',
			type = 'black event',
			event = function(self, deck)
				print('lose money')
			end,
			sprite = 'charlatan',
			valueTextColor = {1, 1, 1},
		},
		ha = {
			name = 'Hard Labor',
			value = 0,
			score = 0,
			group = 'black',
			type = 'black event',
			event = function(self, deck)
				
			end,
			sprite = 'hardLabor',
			valueTextColor = {1, 1, 1},
			onElementFlip = function(self)
				local tracker = Gamestate.current().tracker
				self.value = tracker:getElementNum() + tracker:getGoldEventNum()
				self.score = -self.value
			end,
			onGoldEventFlip = function(self)
				local tracker = Gamestate.current().tracker
				self.value = tracker:getElementNum() + tracker:getGoldEventNum()
				self.score = -self.value
			end,
		}
	},
	
	equipments = {
		al = {
			name = 'Alembic',
			sprite = 'alembic',
			onHit = function(self, decks, deckHit)
				local Card = require 'src.game.card'
				
				local cardIds = {}
				for _, id in ipairs(Gamestate.current().args.baseDeck) do
					table.insert(cardIds, id)
				end
				for _, id in ipairs(Gamestate.current().args.wildCards) do
					table.insert(cardIds, id)
				end
				
				local cardInfo = DATA.cardInfos[cardIds[math.random(1, #cardIds)]]		
				deckHit.cards[1] = Card(cardInfo.name, cardInfo.value, cardInfo.score, cardInfo.triValue,
								cardInfo.group, cardInfo.type, cardInfo.triType,
								cardInfo.event,
								cardInfo.sprite, cardInfo.valueTextColor,
								cardInfo.onElementFlip, cardInfo.onGoldEventFlip)
				deckHit:emitOnCardChangedEvent()
			end,
			drawCardOnNextDeckHit = false,
		},
		mor = {
			name = 'Mortar and Pestle',
			sprite = 'mortarAndPestle',
			onHit = function(self, decks, deckHit)
				deckHit.isVisible = true
			end,
			drawCardOnNextDeckHit = false,
		},
		ph = {
			name = "Philosopher's Stone",
			sprite = 'philosopherStone',
			onHit = function(self, decks, deckHit)
				Gamestate.current().scoreManager:setScoreAmplifier(3)
			end,
			drawCardOnNextDeckHit = true,
		},
	}
}
