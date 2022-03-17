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
	background = love.graphics.newImage('assets/game_background.png'),
	menu = love.graphics.newImage('assets/menu.png')
}

Audios = {
	flip = love.audio.newSource('assets/audio/Card-flip-sound-effect.mp3', 'static'),
	stab = love.audio.newSource('assets/audio/remove.wav', 'static'),
}

lAYOUT = love.graphics.newImage('assets/layout-01.png')
