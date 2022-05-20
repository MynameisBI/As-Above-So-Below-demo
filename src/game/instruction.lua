local Instruction = Class('Instruction')

local orange, red, white = {211/255, 125/255, 58/255}, {195/255, 52/255, 70/255}, {1, 1, 1}

function Instruction:initialize()
	self.isEnabled = false
	self.text = {}
	
	local signal = Gamestate.current().signal
	
	signal:register('draw card',
			function()
				self.text = {white, 'You draw a card'}
			end)
			
	signal:register('stab card',
			function()
				self.text = {white, 'You stab a card'}
			end)
			
	signal:register('flip and count',
			function(card)
				if card.group == 'element' then
					self.text = {
						white,  'It is an elemental card, ',
						red,    string.upper(card.type),
						white,  ' element.\nYou get ',
						orange, tostring(card.value),
						white,  ' points and the ',
						red,    string.upper(card.type),
						white,  ' flame.'
					} 
				elseif card.name == 'Gold 4' then
					self.text = {
						white,  'It is a gold card, its name is ',
						red,    'PRIMA',
						white,  '.\nYou get ',
						orange, '5',
						white,  ' points.'
					}	
				elseif card.type == 'gold event' then
					self.text = { 
						white,  'It is a gold event card, its name is ',
						red,    string.upper(card.triType),
						white,  ' Principle.\nYou get the ',
						red,    '',
						white   ' principle flame.'
					}
					if card.triType == 'body' then self.text[8] = 'WHITE'
					elseif card.triType == 'soul' then self.text[8] = 'RED'
					elseif card.triType == 'spirit' then self.text[8] = 'BLACK'
					end
				elseif card.name == 'Black 4' then
					self.text = {
						white,  'It is a black card, its name is ', 
						red,    'AETHER',
						white,  '.\nYou lose ',
						orange, '5',
						white,  ' points.',
					}
				elseif card.type == 'black event' then
					if card.name == 'Heresy' then
						self.text = {white, 'Two cards from the deck you just drew will be removed.'}
					elseif card.name == 'Charlatan' then
						self.text = {white, 'The selling price of some metal ingots will decrease in the next trading session.'}
					elseif card.name == 'Hard Labor' then
						self.text = {white, 'You lose __ points. It depends on how many flames you got.'}
					end
				end
			end)
			
	signal:register('flip and ignore',
			function(card)
				if card.group == 'element' then
					self.text = {
						white, 'It is an element card, its name is ',
						red,   card.name,
						white, '. Poor you.',
					}
				elseif card.group == 'gold' then
					self.text = {
						white, 'It is a '..card.type..' card, its name is ',
						red,   card.name,
						white, '. Poor you.',
					}
				elseif card.group == 'black' then
					self.text = {
						white, 'It is a '..card.type..' card, its name is ',
						red,   card.name,
						white, '. Bless you.',
					}
				end
			end)
			
	signal:register('hover equipment',
			function(equipment)
				self.text = {
					white,  'It is an equipment card, its name is ',
					red,    '',
					white,  '',
				}			
				if equipment.name == 'Alembic' then
					self.text[4] = 'ALEMBIC'
					self.text[6] = '.\nIt transforms a face-down card into another card within the limit of cardtypes of the level.'
				elseif equipment.name == 'Mortar and Pestle' then
					self.text[4] = 'MORTAR & PESTLE'
					self.text[6] = '.\nYou can see a face-down card at the top of a deck.'
				elseif equipment.name == "Philosopher's Stone" then
					self.text[4] = 'PHILOSOPHER\'S STONE'
					self.text[6] = '.\nThe score of the next card you draw will be tripled.'
				end
			end)
			
	signal:register('use equipment',
			function()
				self.text = {white, 'You used that equipment card.'}
			end)
end

function Instruction:draw()
	if not self.isEnabled then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.instruction.textBox, 0, 802)
	
	love.graphics.printf(self.text, Fonts.dialogue_small, 20, 912, 640)
end

return Instruction
