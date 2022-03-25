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
	menu = love.graphics.newImage('assets/menu.png')
}

Audios = {
	select = love.audio.newSource('assets/audio/select.wav', 'static'),
	flip = love.audio.newSource('assets/audio/Card-flip-sound-effect.mp3', 'static'),
	remove = love.audio.newSource('assets/audio/remove.wav', 'static'),
	positive = love.audio.newSource('assets/audio/positive.wav', 'static'),
	negative = love.audio.newSource('assets/audio/negative.wav', 'static'),
}

Fonts = {
	cardValue = love.graphics.newFont('assets/fonts/Olondon_.otf', 40),
	score = love.graphics.newFont('assets/fonts/Olondon_.otf', 60),
	cardsLeft = love.graphics.newFont('assets/fonts/Olondon_.otf', 52),
}

lAYOUT = love.graphics.newImage('assets/layout-01.png')
