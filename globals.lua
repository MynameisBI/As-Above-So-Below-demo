Class = require 'libs.middleclass'
Gamestate = require 'libs.gamestate'
Timer = require 'libs.timer'
Suit = require 'libs.suit'
Camera = require 'libs.camera'
Anim8 = require 'libs.anim8'
Signal = require 'libs.signal'

Settings = {
	isDebug = false,
	cardAutomaticallyFadeAway = false,
	
	hasEnteredMenu = false,
	hasOpenedTrading = false,
	hasOpenedTopDrawer = false,
	hasOpenedMidDrawer = false,
	hasOpenedBotDrawer = false,
	hasEnteredWorld = false,
	hasEnteredTutorialLevel = false,	
	hasReturnedFromTutorialLevel = false,
	hasWon = false,
	hasLost = false,
	hasSeenResult = false,
	hasOpenedTheBeginningUI = false,
	hasOpenedTheMainGateUI = false,
	hasOpenedTheBridgeTownUI = false,
	hasOpenedTheMonasteryUI = false,
	hasOpenedTheNightTavernUI = false,
	hasOpenedTheRoyalFortressUI = false,
}
