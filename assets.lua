Sprites = {
	cards = {
		back = love.graphics.newImage('assets/cards/backside.png'),
		front = {
			fire = love.graphics.newImage('assets/cards/fire_element.png'),
			water = love.graphics.newImage('assets/cards/water_element.png'),
			earth = love.graphics.newImage('assets/cards/earth_element.png'),
			air = love.graphics.newImage('assets/cards/air_element.png'),
			gold = love.graphics.newImage('assets/cards/gold.png'),
			['gold event tri prima body'] = love.graphics.newImage('assets/cards/gold_event_tri_prima_Body.png'),
			['gold event tri prima soul'] = love.graphics.newImage('assets/cards/gold_event_tri_prima_Soul.png'),
			black = love.graphics.newImage('assets/cards/black.png'),
			['black event 1'] = love.graphics.newImage('assets/cards/black_event_1.png'),
			['black event 2'] = love.graphics.newImage('assets/cards/black_event_2.png'),
		}
	},
	hints = {
		typeHints = {
			horizontal = {
				['='] = love.graphics.newImage('assets/hints/tHint_hor_==.png'),
				['~'] = love.graphics.newImage('assets/hints/tHint_hor_~.png'),
				['=/='] = love.graphics.newImage('assets/hints/tHint_hor_~=.png'),
			},
			vertical = {
				['='] = love.graphics.newImage('assets/hints/tHint_ver_==.png'),
				['~'] = love.graphics.newImage('assets/hints/tHint_ver_~.png'),
				['=/='] = love.graphics.newImage('assets/hints/tHint_ver_~=.png'),
			}
		},
		valueHints = {
			horizontal = {
				['='] = love.graphics.newImage('assets/hints/vHint_hor_=.png'),
				['<'] = love.graphics.newImage('assets/hints/vHint_hor_right.png'),
				['>'] = love.graphics.newImage('assets/hints/vHint_hor_left.png'),
			},
			vertical = {
				['='] = love.graphics.newImage('assets/hints/vHint_ver_=.png'),
				['<'] = love.graphics.newImage('assets/hints/vHint_ver_down.png'),
				['>'] = love.graphics.newImage('assets/hints/vHint_ver_up.png'),
			}
		},
	},
	background = love.graphics.newImage('assets/game_background.png'),
	backgrounds = {
		bridgeTown = love.graphics.newImage('assets/gameBackgrounds/bridgeTown.png'),
		mainGate = love.graphics.newImage('assets/gameBackgrounds/mainGate.png'),
		monastery = love.graphics.newImage('assets/gameBackgrounds/monastery.png'),
		nightTavern = love.graphics.newImage('assets/gameBackgrounds/nightTavern.png'),
		theBeginning = love.graphics.newImage('assets/gameBackgrounds/theBeginning.png'),
		theRoyalFortress = love.graphics.newImage('assets/gameBackgrounds/theRoyalFortress.png'),
	},
	result = {
		background = love.graphics.newImage('assets/result/result UI bg.png'),
		openLevelMap = love.graphics.newImage('assets/result/open level map shortcut.png'),
		openTradingPlace = love.graphics.newImage('assets/result/open trading place shortcut.png'),
		replay = love.graphics.newImage('assets/result/replay.png'),
		scrollBar = love.graphics.newImage('assets/result/scroll bar.png'),
		scrollBox = love.graphics.newImage('assets/result/scroll box.png'),
		shareButton = love.graphics.newImage('assets/result/share button.png'),
		worldHighscoreButton = love.graphics.newImage('assets/result/world highscore button.png'),
		XButton = love.graphics.newImage('assets/result/X button.png'),
	},
	pauseButton = love.graphics.newImage('assets/options button.png'),
	pause = {
		background = love.graphics.newImage('assets/pause/background.png'),
		bgm = love.graphics.newImage('assets/pause/bgm button.png'),
		toggleAutoFade = love.graphics.newImage('assets/pause/card automatically fade button.png'),
		continue = love.graphics.newImage('assets/pause/continue playing button.png'),
		exitLevel = love.graphics.newImage('assets/pause/exit level button.png'),
		options = love.graphics.newImage('assets/pause/options button.png'),
		replay = love.graphics.newImage('assets/pause/replay button.png'),
		sound = love.graphics.newImage('assets/pause/sound button.png'),
		toggleDebug = love.graphics.newImage('assets/pause/toggle debug button.png'),
		X = love.graphics.newImage('assets/pause/X button.png'),
	},
	instruction = {
		button = love.graphics.newImage('assets/instruction/emerald tablet.png'),
		XButton = love.graphics.newImage('assets/instruction/X button.png'),
		background = love.graphics.newImage('assets/instruction/instruction bg.png'),
	},
	loadingScreen = love.graphics.newVideo('assets/loadingScreen.ogg'),
	
	menu = {
		background = love.graphics.newImage('assets/menu/background.png'),
		achievements = {
			normal = love.graphics.newImage('assets/menu/achievements.png'),
			hovered = love.graphics.newImage('assets/menu/achievements (after).png'),
		},
		authorsInformation = {
			normal = love.graphics.newImage('assets/menu/authors information.png'),
			hovered = love.graphics.newImage('assets/menu/authors information (after).png'),
		},
		cardsCollection = {
			normal = love.graphics.newImage('assets/menu/cards collection.png'),
			hovered = love.graphics.newImage('assets/menu/cards collection (after).png'),
		},
		dailyChallenges = {
			normal = love.graphics.newImage('assets/menu/daily challenges.png'),
			hovered = love.graphics.newImage('assets/menu/daily challenges (after).png'),
		},
		inventory = {
			normal = love.graphics.newImage('assets/menu/inventory.png'),
			hovered = love.graphics.newImage('assets/menu/inventory (after).png'),
		},
		settings = {
			normal = love.graphics.newImage('assets/menu/settings.png'),
			hovered = love.graphics.newImage('assets/menu/settings (after).png'),
		},
		tradings = {
			normal = love.graphics.newImage('assets/menu/tradings.png'),
			hovered = love.graphics.newImage('assets/menu/tradings (after).png'),
		},
		worldMap = {
			normal = love.graphics.newImage('assets/menu/world map.png'),
			hovered = love.graphics.newImage('assets/menu/world map (after).png'),
		},
		
		XButton = love.graphics.newImage('assets/menu/X button.png'),
		creditsFrame = {
			credits = love.graphics.newImage('assets/menu/credits/authors information UI.png')
		},
		settingsFrame = {
			background = love.graphics.newImage('assets/menu/settings/settings menu UI.png'),
			bgm = love.graphics.newImage('assets/menu/settings/bgm button.png'),
			exitLevel = love.graphics.newImage('assets/menu/settings/exit level button.png'),
			sound = love.graphics.newImage('assets/menu/settings/sound button.png'),
		}
	},
	
	world = {
		startingPoint = love.graphics.newImage('assets/world/starting point.png'),
	
		arab = love.graphics.newImage('assets/world/arab.png'),
		eastAsia = love.graphics.newImage('assets/world/east asia.png'),
		egypt = love.graphics.newImage('assets/world/egypt.png'),
		europe = love.graphics.newImage('assets/world/europe.png'),
		greece = love.graphics.newImage('assets/world/greece.png'),
		india = love.graphics.newImage('assets/world/india.png'),
		
		returnButton = love.graphics.newImage('assets/world/return.png'),
		
		worldMap = love.graphics.newImage('assets/world/world map.png')
	},
	
	level = {
		levelMap = love.graphics.newImage('assets/level/level_map.png'),
		
		tutorialLevel = love.graphics.newImage('assets/level/tutorial_level.png'),
		tradingPlace = love.graphics.newImage('assets/level/trading_place.png'),
		normalLevelGate = love.graphics.newImage('assets/level/normal_level_gate.png'),
		normalLevelBridge = love.graphics.newImage('assets/level/normal_level_bridge.png'),
		normalLevelChurch = love.graphics.newImage('assets/level/normal_level_church.png'),
		normalLevelTavern = love.graphics.newImage('assets/level/normal_level_tavern.png'),
		castleLevel = love.graphics.newImage('assets/level/castle_level.png'),
		
		levelsUI = {
			bridge = love.graphics.newImage('assets/level/UIs/bridge town level UI.png'),
			mainGate = love.graphics.newImage('assets/level/UIs/main gate level UI.png'),
			monastery = love.graphics.newImage('assets/level/UIs/monastery level UI.png'),
			tavern = love.graphics.newImage('assets/level/UIs/night tavern level UI.png'),
			beginning = love.graphics.newImage('assets/level/UIs/the beginning level UI.png'),
			fortress = love.graphics.newImage('assets/level/UIs/the royal fortress level (final level) UI.png'),
			
			equipmentCards = love.graphics.newImage('assets/level/UIs/equipment cards.png'),
			start = love.graphics.newImage('assets/level/UIs/start.png'),
			XButton = love.graphics.newImage('assets/level/UIs/X button.png'),
		}
	},
}

function newAnimator(imagePath, frameWidth, frameHeight, frameAmmount, frameIndexes, durations, onLoop)
	local animator = {}
	
	local image = love.graphics.newImage(imagePath)
	
	local grid = Anim8.newGrid(frameWidth, frameHeight, image:getWidth(), image:getHeight())
	
	local frames
	if frameIndexes == nil then frames = grid('1-'..tostring(frameAmmount), 1)
	else frames = grid(unpack(frameIndexes))
	end
	
	local animation = Anim8.newAnimation(frames, durations, onLoop)
	
	local update = function(self, dt)
		self.animation:update(dt)
	end
	local draw = function(self, x, y, r, sx, sy, ox, oy, kx, ky)
		self.animation:draw(self.image, x, y, r, sx, sy, frameWidth/2, frameHeight/2, kx, ky)
	end
	
	return {image = image, grid = grid, animation = animation, update = update, draw = draw}
end
Animators = {
	explosions = {
		goldEvent = newAnimator('assets/animations/explosion_GE.png', 96, 96, 28, nil, 0.02, 'pauseAtStart'),
		element = newAnimator('assets/animations/explosion_element.png', 64, 64, 33, nil, 0.02, 'pauseAtStart'),
		done = newAnimator('assets/animations/done_element.png', 133, 133, 60, nil, 0.02, 'pauseAtStart'),
		cardClick = newAnimator('assets/animations/card_click.png', 64, 32, 5, {1, '1-5'}, 0.03, 'pauseAtStart')
	},
	flames = {
		goldEvent = newAnimator('assets/animations/flame_GE.png', 96, 96, 60, nil, 0.02),
		fire = newAnimator('assets/animations/element_fire.png', 68, 9, 60,
				{'1-10',1, '1-10',2 ,'1-10',3 ,'1-10',4, '1-10',5 ,'1-10',6}, 0.02),
		air = newAnimator('assets/animations/element_air.png', 84, 9, 60,
				{'1-10',1, '1-10',2 ,'1-10',3 ,'1-10',4, '1-10',5 ,'1-10',6}, 0.02),
		water = newAnimator('assets/animations/element_water.png', 84, 9, 60,
				{'1-10',1, '1-10',2 ,'1-10',3 ,'1-10',4, '1-10',5 ,'1-10',6}, 0.02),
		earth = newAnimator('assets/animations/element_earth.png', 65, 9, 60,
				{'1-10',1, '1-10',2 ,'1-10',3 ,'1-10',4, '1-10',5 ,'1-10',6}, 0.02),
	},
}

Audios = {
	select = love.audio.newSource('assets/audio/select.wav', 'static'),
	flip = love.audio.newSource('assets/audio/Card-flip-sound-effect.mp3', 'static'),
	remove = love.audio.newSource('assets/audio/remove.wav', 'static'),
	positive = love.audio.newSource('assets/audio/positive.wav', 'static'),
	negative = love.audio.newSource('assets/audio/negative.wav', 'static'),
	tearInHalf = love.audio.newSource('assets/audio/tearInHalf.mp3', 'static'),
}

Fonts = {
	cardValue = love.graphics.newFont('assets/fonts/Olondon_.otf', 40),
	score = love.graphics.newFont('assets/fonts/Olondon_.otf', 70),
	cardsLeft = love.graphics.newFont('assets/fonts/Olondon_.otf', 52),
	
	result_small = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 52),
	result_big = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 180),
	result_number = love.graphics.newFont('assets/fonts/Olondon_.otf', 254),
}

lAYOUT = love.graphics.newImage('assets/layout-01.png')
