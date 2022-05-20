Sprites = {
	cards = {
		back = love.graphics.newImage('assets/cards/backside.png'),
		front = {
			fire = love.graphics.newImage('assets/cards/fire_element.png'),
			water = love.graphics.newImage('assets/cards/water_element.png'),
			earth = love.graphics.newImage('assets/cards/earth_element.png'),
			air = love.graphics.newImage('assets/cards/air_element.png'),
			gold = love.graphics.newImage('assets/cards/gold.png'),
			['gold event body'] = love.graphics.newImage('assets/cards/gold_event_Body.png'),
			['gold event soul'] = love.graphics.newImage('assets/cards/gold_event_Soul.png'),
			['gold event spirit'] = love.graphics.newImage('assets/cards/gold_event_Spirit.png'),
			black = love.graphics.newImage('assets/cards/black.png'),
			heresy = love.graphics.newImage('assets/cards/heresy.png'),
			charlatan = love.graphics.newImage('assets/cards/charlatan.png'),
			hardLabor = love.graphics.newImage('assets/cards/hard_labor.png'),
		},
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
			},
		},
	},
	background = love.graphics.newImage('assets/game_background.png'),
	backgrounds = {
		bridgeTown = love.graphics.newImage('assets/gameBackgrounds/bridgeTown.png'),
		mainGate = love.graphics.newImage('assets/gameBackgrounds/mainGate.png'),
		monastery = love.graphics.newImage('assets/gameBackgrounds/monastery.png'),
		nightTavern = love.graphics.newImage('assets/gameBackgrounds/nightTavern.png'),
		theBeginning = love.graphics.newImage('assets/gameBackgrounds/theBeginning.png'),
		warmUp = love.graphics.newImage('assets/gameBackgrounds/theBeginning.png'),
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
		-- instructionFrame
		button = love.graphics.newImage('assets/instruction/emerald tablet.png'),
		XButton = love.graphics.newImage('assets/instruction/X button.png'),
		background = love.graphics.newImage('assets/instruction/instruction bg.png'),
		frameButtons = {
			cardTypes = love.graphics.newImage('assets/instruction/cardtypes button.png'),
			cardTypesEachDeck = love.graphics.newImage('assets/instruction/cardtypes each deck button.png'),
			dailyQuests = love.graphics.newImage('assets/instruction/daily quests button.png'),
			howToPlay = love.graphics.newImage('assets/instruction/how to play button.png'),
			instructionInGame = {
				on = love.graphics.newImage('assets/instruction/instruction ingame ON.png'),
				off = love.graphics.newImage('assets/instruction/instruction ingame OFF.png'),
			},
			levelGoal = love.graphics.newImage('assets/instruction/level goal button.png'),
			others = love.graphics.newImage('assets/instruction/others button.png'),
		},
		-- instruction
		textBox = love.graphics.newImage('assets/instruction/text box.png'),
	},
	gameIntros = {
		bridgeTown = {
			love.graphics.newImage('assets/gameIntro/bridge town/bridgeTownTitle.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/1.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/2.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/3.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/4.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/5.png'),
			love.graphics.newImage('assets/gameIntro/bridge town/5.5.png'),
		}, 
		mainGate = {
			love.graphics.newImage('assets/gameIntro/main gate/mainGateTitle.png'),
			love.graphics.newImage('assets/gameIntro/main gate/1.png'),
			love.graphics.newImage('assets/gameIntro/main gate/2.png'),
			love.graphics.newImage('assets/gameIntro/main gate/3.png'),
			love.graphics.newImage('assets/gameIntro/main gate/4.png'),
			love.graphics.newImage('assets/gameIntro/main gate/5.png'),
			love.graphics.newImage('assets/gameIntro/main gate/5.5.png'),
		},
		monastery = {
			love.graphics.newImage('assets/gameIntro/monastery/monasteryTitle.png'),
			love.graphics.newImage('assets/gameIntro/monastery/1.png'),
			love.graphics.newImage('assets/gameIntro/monastery/2.png'),
			love.graphics.newImage('assets/gameIntro/monastery/3.png'),
			love.graphics.newImage('assets/gameIntro/monastery/4.png'),
			love.graphics.newImage('assets/gameIntro/monastery/5.png'),
			love.graphics.newImage('assets/gameIntro/monastery/5.5.png'),
		},
		nightTavern = {
			love.graphics.newImage('assets/gameIntro/night tavern/nightTavernTitle.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/1.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/2.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/3.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/4.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/5.png'),
			love.graphics.newImage('assets/gameIntro/night tavern/5.5.png'),
		}, 
		theBeginning = {
			love.graphics.newImage('assets/gameIntro/the beginning/theBeginningTitle.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/1.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/2.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/3.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/4.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/5.png'),
			love.graphics.newImage('assets/gameIntro/the beginning/5.5.png'),
		}, 
		theRoyalFortress = {
			love.graphics.newImage('assets/gameIntro/the royal fortress/theRoyalFortressTitle.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/1.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/2.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/3.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/4.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/5.png'),
			love.graphics.newImage('assets/gameIntro/the royal fortress/5.5.png'),
		},
		warmUp = {
			love.graphics.newImage('assets/gameIntro/warmup/warmUpTitle.png'),
			love.graphics.newImage('assets/gameIntro/warmup/1.png'),
			love.graphics.newImage('assets/gameIntro/warmup/2.png'),
			love.graphics.newImage('assets/gameIntro/warmup/3.png'),
			love.graphics.newImage('assets/gameIntro/warmup/4.png'),
			love.graphics.newImage('assets/gameIntro/warmup/5.png'),
			love.graphics.newImage('assets/gameIntro/warmup/5.5.png'),
		}
	},
	
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
		
		tutorialLevel = love.graphics.newImage('assets/level/theBeginningLevel.png'),
		tradingPlace = love.graphics.newImage('assets/level/tradingPlace.png'),
		normalLevelGate = love.graphics.newImage('assets/level/mainGateLevel.png'),
		normalLevelBridge = love.graphics.newImage('assets/level/bridgeTownLevel.png'),
		normalLevelChurch = love.graphics.newImage('assets/level/monasteryLevel.png'),
		normalLevelTavern = love.graphics.newImage('assets/level/nightTavernLevel.png'),
		castleLevel = love.graphics.newImage('assets/level/theRoyalFortressLevel.png'),
		
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
	
	levels = {
		tutorial = {
			levelMap = love.graphics.newImage('assets/levels/tutorial/map.png'),
			
			t1 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 1.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 1 (after).png')
			},
			t2 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 2.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 2 (after).png')
			},
			t3 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 3.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 3 (after).png')
			},
			t4 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 4.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 4 (after).png')
			},
			t5 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 5.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 5 (after).png')
			},
			t6 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 6.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 6 (after).png')
			},
			t7 = {
				normal = love.graphics.newImage('assets/levels/tutorial/tutorial 7.png'),
				hovered = love.graphics.newImage('assets/levels/tutorial/tutorial 7 (after).png')
			},
			warmUp = love.graphics.newImage('assets/levels/tutorial/warm up level.png'),
			warmUpUI = love.graphics.newImage('assets/levels/tutorial/warm up UI.png'),
			XButton = love.graphics.newImage('assets/levels/tutorial/x button (tutorial).png')
		}
	},
	
	trading = {
		background = love.graphics.newImage('assets/trading/tradings bg.png'),
		equipmentCards = {
			normal = love.graphics.newImage('assets/trading/equipmentCards.png'),
			hovered = love.graphics.newImage('assets/trading/equipmentCards (after).png')
		},
		metalsIngredients = {
			normal = love.graphics.newImage('assets/trading/metalsIngredients.png'),
			hovered = love.graphics.newImage('assets/trading/metalsIngredients (after).png')
		},
		trading = {
			normal = love.graphics.newImage('assets/trading/trading.png'),
			hovered = love.graphics.newImage('assets/trading/trading (after).png')
		},
		
	},
	
	inDevelopment = love.graphics.newImage('assets/inDevelopment.png'),
	
	loadingScreens = {
		love.graphics.newImage('assets/loadingScreen/loading1.png'),
		love.graphics.newImage('assets/loadingScreen/loading2.png'),
		love.graphics.newImage('assets/loadingScreen/loading3.png'),
		love.graphics.newImage('assets/loadingScreen/loading4.png'),
	},
	
	intro = {
		title = love.graphics.newImage('assets/intro/titleIntro.png'),
		loadingScreen = love.graphics.newImage('assets/intro/loadingBackground.png'),
	},
	
	equipments = {
		alembic = love.graphics.newImage('assets/equipments/alembic.png'),
		mortarAndPestle = love.graphics.newImage('assets/equipments/mortarAndPestle.png'),
		philosopherStone = love.graphics.newImage('assets/equipments/philosopherStone.png'),
	},
	
	dialogue = {
		textBox = love.graphics.newImage('assets/dialogue/text box.png'),
		oppy = {
			love.graphics.newImage('assets/dialogue/1.png'),
			love.graphics.newImage('assets/dialogue/2.png'),
			love.graphics.newImage('assets/dialogue/3.png'),
			love.graphics.newImage('assets/dialogue/4.png'),
			love.graphics.newImage('assets/dialogue/5.png'),
			love.graphics.newImage('assets/dialogue/6.png'),
		},
		skipButton = love.graphics.newImage('assets/dialogue/skip button.png'),
		tutorials = {
			[1] = {
				[1] = love.graphics.newImage('assets/dialogue/tutorial/1/1.png'),
				[2] = love.graphics.newImage('assets/dialogue/tutorial/1/2.png'),
				[2.5] = love.graphics.newImage('assets/dialogue/tutorial/1/2.5.png'),
				[3] = love.graphics.newImage('assets/dialogue/tutorial/1/3.png'),
				[4] = love.graphics.newImage('assets/dialogue/tutorial/1/4.png'),
				[5] = love.graphics.newImage('assets/dialogue/tutorial/1/5.png'),
				[6] = love.graphics.newImage('assets/dialogue/tutorial/1/6.png'),
			},
			[2] = {
				[1] = love.graphics.newImage('assets/dialogue/tutorial/2/1.png'),
				[2] = love.graphics.newImage('assets/dialogue/tutorial/2/2.png'),
				[3] = love.graphics.newImage('assets/dialogue/tutorial/2/3.png'),
				[4] = love.graphics.newImage('assets/dialogue/tutorial/2/4.png'),
				[5] = love.graphics.newImage('assets/dialogue/tutorial/2/5.png'),
				[6] = love.graphics.newImage('assets/dialogue/tutorial/2/6.png'),
			},
			[3] = {
				[1.1] = love.graphics.newImage('assets/dialogue/tutorial/3/1.1.png'),
				[1.2] = love.graphics.newImage('assets/dialogue/tutorial/3/1.2.png'),
				[1.3] = love.graphics.newImage('assets/dialogue/tutorial/3/1.3.png'),
				[1.4] = love.graphics.newImage('assets/dialogue/tutorial/3/1.4.png'),
				[1.5] = love.graphics.newImage('assets/dialogue/tutorial/3/1.5.png'),
				[2.1] = love.graphics.newImage('assets/dialogue/tutorial/3/2.1.png'),
				[2.2] = love.graphics.newImage('assets/dialogue/tutorial/3/2.2.png'),
				[2.3] = love.graphics.newImage('assets/dialogue/tutorial/3/2.3.png'),
				[3.1] = love.graphics.newImage('assets/dialogue/tutorial/3/3.1.png'),
				[3.2] = love.graphics.newImage('assets/dialogue/tutorial/3/3.2.png'),
				[3.3] = love.graphics.newImage('assets/dialogue/tutorial/3/3.3.png'),
				[3.4] = love.graphics.newImage('assets/dialogue/tutorial/3/3.4.png'),
				[4.1] = love.graphics.newImage('assets/dialogue/tutorial/3/4.1.png'),
				[4.2] = love.graphics.newImage('assets/dialogue/tutorial/3/4.2.png'),
				[4.3] = love.graphics.newImage('assets/dialogue/tutorial/3/4.3.png'),
				[5.1] = love.graphics.newImage('assets/dialogue/tutorial/3/5.1.png'),
				[5.2] = love.graphics.newImage('assets/dialogue/tutorial/3/5.2.png'),
			},
			[4] = {
				[1] = love.graphics.newImage('assets/dialogue/tutorial/4/1.png'),
				[1.5] = love.graphics.newImage('assets/dialogue/tutorial/4/1.5.png'),
				[2] = love.graphics.newImage('assets/dialogue/tutorial/4/2.png'),
				[2.5] = love.graphics.newImage('assets/dialogue/tutorial/4/2.5.png'),
				[3.1] = love.graphics.newImage('assets/dialogue/tutorial/4/3.1.png'),
				[3.2] = love.graphics.newImage('assets/dialogue/tutorial/4/3.2.png'),
				[3.3] = love.graphics.newImage('assets/dialogue/tutorial/4/3.3.png'),
				[4.1] = love.graphics.newImage('assets/dialogue/tutorial/4/4.1.png'),
				[4.2] = love.graphics.newImage('assets/dialogue/tutorial/4/4.2.png'),
				[4.3] = love.graphics.newImage('assets/dialogue/tutorial/4/3.3.png'),
			},
			[5] = {
				[1.1] = love.graphics.newImage('assets/dialogue/tutorial/5/1.1.png'),
				[1.2] = love.graphics.newImage('assets/dialogue/tutorial/5/1.2.png'),
				[1.3] = love.graphics.newImage('assets/dialogue/tutorial/5/1.3.png'),
				[2.1] = love.graphics.newImage('assets/dialogue/tutorial/5/2.1.png'),
				[2.2] = love.graphics.newImage('assets/dialogue/tutorial/5/2.2.png'),
				[3.1] = love.graphics.newImage('assets/dialogue/tutorial/5/3.1.png'),
				[3.2] = love.graphics.newImage('assets/dialogue/tutorial/5/3.2.png'),
				[3.3] = love.graphics.newImage('assets/dialogue/tutorial/5/3.3.png'),
				[3.4] = love.graphics.newImage('assets/dialogue/tutorial/5/3.4.png'),
			},
			[6] = {
				[1.1] = love.graphics.newImage('assets/dialogue/tutorial/6/1.1.png'),
				[1.2] = love.graphics.newImage('assets/dialogue/tutorial/6/1.2.png'),
				[2.1] = love.graphics.newImage('assets/dialogue/tutorial/6/2.1.png'),
				[2.2] = love.graphics.newImage('assets/dialogue/tutorial/6/2.2.png'),
				[2.3] = love.graphics.newImage('assets/dialogue/tutorial/6/2.3.png'),
				[3.1] = love.graphics.newImage('assets/dialogue/tutorial/6/3.1.png'),
				[3.2] = love.graphics.newImage('assets/dialogue/tutorial/6/3.2.png'),
				[3.3] = love.graphics.newImage('assets/dialogue/tutorial/6/3.3.png'),
				[4] = love.graphics.newImage('assets/dialogue/tutorial/6/4.png'),
			},
			[7] = {
				[1] = love.graphics.newImage('assets/dialogue/tutorial/7/1.png'),
				[2.1] = love.graphics.newImage('assets/dialogue/tutorial/7/2.1.png'),
				[2.2] = love.graphics.newImage('assets/dialogue/tutorial/7/2.2.png'),
				[3.1] = love.graphics.newImage('assets/dialogue/tutorial/7/3.1.png'),
				[3.2] = love.graphics.newImage('assets/dialogue/tutorial/7/3.2.png'),
				[4] = love.graphics.newImage('assets/dialogue/tutorial/7/4.png'),
				[5] = love.graphics.newImage('assets/dialogue/tutorial/7/5.png'),
			},
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
		cardClick = newAnimator('assets/animations/card_click.png', 64, 32, 5, {1, '1-5'}, 0.03, 'pauseAtStart'),
		equipmentUse = newAnimator('assets/animations/equipmentUse.png', 96, 96, 28, nil, 0.02, 'pauseAtStart')
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
	cardClick = {
		draw = newAnimator('assets/animations/drawCard.png', 256, 256, 4, {1, '1-4'}, 0.133, 'pauseAtStart'),
		stab = newAnimator('assets/animations/stabCard.png', 256, 250, 4, nil, 0.133, 'pauseAtStart'),
	},
	loadingSymbol = newAnimator('assets/animations/loadingSymbol.png', 287, 550, 26, nil, 0.15,'pauseAtEnd'),
}

Videos = {
	intro = love.graphics.newVideo('assets/intro/intro.ogv'),
	pIntro = love.graphics.newVideo('assets/intro/playerIntro.ogv')
}

Audios = {
	positive = love.audio.newSource('assets/audio/positive.wav', 'static'),
	negative = love.audio.newSource('assets/audio/negative.wav', 'static'),
	
	intro = love.audio.newSource('assets/intro/bgm.mp3', 'stream'),
	
	bgm = {
		tutorial = love.audio.newSource('assets/audio/bgm/all tutorial levels bgm.mp3', 'stream'),
		bridgeTown = love.audio.newSource('assets/audio/bgm/bridge town level bgm.mp3', 'stream'),
		mainGate = love.audio.newSource('assets/audio/bgm/main gate level bgm.mp3', 'stream'),
		monastery = love.audio.newSource('assets/audio/bgm/monastery level bgm.mp3', 'stream'),
		nightTavern = love.audio.newSource('assets/audio/bgm/night tavern level bgm.mp3', 'stream'),
		theBeginning = love.audio.newSource('assets/audio/bgm/the beginning level bgm.mp3', 'stream'),
		theRoyalFortress = love.audio.newSource('assets/audio/bgm/the royal fortress level bgm.mp3', 'stream'),
		warmUp = love.audio.newSource('assets/audio/bgm/warm up level bgm.mp3', 'stream'),
		levelMap = love.audio.newSource('assets/audio/bgm/levelmap bgm.mp3', 'stream'),
		menu = love.audio.newSource('assets/audio/bgm/menu bgm.mp3', 'stream'),
		titleIntro = love.audio.newSource('assets/audio/bgm/title intro bgm.mp3', 'stream'),
		tradings = love.audio.newSource('assets/audio/bgm/tradings bgm.mp3', 'stream'),
		worldMap = love.audio.newSource('assets/audio/bgm/worldmap bgm.mp3', 'stream'),
	},
	
	cardSounds = {
		black = love.audio.newSource('assets/audio/card sounds/black.mp3', 'static'),
		flip = love.audio.newSource('assets/audio/card sounds/card flip.mp3', 'static'),
		charlatan = love.audio.newSource('assets/audio/card sounds/charlatan.mp3', 'static'),
		element = love.audio.newSource('assets/audio/card sounds/element.mp3', 'static'),
		goldEvent = love.audio.newSource('assets/audio/card sounds/gold event.mp3', 'static'),
		gold = love.audio.newSource('assets/audio/card sounds/gold.mp3', 'static'),
		hardLabor = love.audio.newSource('assets/audio/card sounds/hard labor.mp3', 'static'),
		heresy = love.audio.newSource('assets/audio/card sounds/heresy.mp3', 'static'),
		remove = love.audio.newSource('assets/audio/card sounds/remove.mp3', 'static'),
		select = love.audio.newSource('assets/audio/card sounds/select.mp3', 'static'),
		tearInHalf = love.audio.newSource('assets/audio/card sounds/tear in half.mp3', 'static'),
	},
	
	otherSounds = {
		button = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		europeLevel = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		lost = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		map = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		replay = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		tradings = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		win = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
		worldMapWonder = love.audio.newSource('assets/audio/other sounds/button.mp3', 'static'),
	},
}

Fonts = {
	cardValue = love.graphics.newFont('assets/fonts/Olondon_.otf', 40),
	score = love.graphics.newFont('assets/fonts/Olondon_.otf', 70),
	cardsLeft = love.graphics.newFont('assets/fonts/Olondon_.otf', 52),
	
	result_small = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 52),
	result_big = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 180),
	result_number = love.graphics.newFont('assets/fonts/Olondon_.otf', 254),
	
	dialogue = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 46),
	dialogue_small = love.graphics.newFont('assets/fonts/JMH Beda.ttf', 32),
}
