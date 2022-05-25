local Icon = require 'src.tutorialLevel.icon'
local Manager = require 'src.tutorialLevel.manager'
local Button = require 'src.game.button'
local LevelUI = require 'src.tutorialLevel.levelUI'
local Line = require 'src.line'

local TutorialLevel = Class('TutorialLevel', State)

local scrollSpeed = 1380

local dialogues = {
	[1] = {
		Line('Welcome to The Great Work guide.', 1, 1),
		Line('You will be introduced to the basic components of the ritual.'),
		
		Line('First, the essential component is the decks of cards. They contain face-down cards.', 1, 2),
		
		Line('This is the number of cards left in each deck.', 1, 2.5),
		
		Line('Second, equally important, are The Hints. ', 1, 3),
		Line('They represent the interaction between the current pair of face-down cards at the top of the decks.'),
		Line('Detailed explaination will be in the next parts.'),
		
		Line('Next, is the score frame. Every time you get points, it will show up here.', 1, 4),
		
		Line('This is The Flame Frames. Flames will flare up when you get the corresponding cards. ', 1, 5),
		Line('It represents rewards you get at the end of the level.'),
		Line('Detailed explaination will be in the next parts.'),
		
		Line('Finally, the supporting components.', 1, 6),
		Line('On the upper left is the Emerald Tablet. It contains the entire guide of the current level up to the general mechanics.'),
		Line('The top right is the settings button.'),
		Line('On the bottom right are the equipment cards. You use them to support the process.'),
		
		Line("That's all. Let's move to the next part.", 1, 1),
	},
	[2] = {
		Line('The most basic thing of The Great Work is the "Draw or Stab" mechanic.', 2, 1),
		
		Line('Left click to perform "Draw" action. It means you accept this card.', 2, 2),
		Line('You will gain the value and take the effect of that card.'),
		
		Line('For example, you just drew the card "Fire Element 2". The draw icon appears in the shape of a hand.', 2, 3),
		Line('You get 2 points and get the red flame.'),
		
		Line('Right-click to perform the "Stab" action. It means you discard this card.', 2, 4),
		Line('You will not gain the value and take no effect of that card.'),
		
		Line('For example, you just drew the card "Fire Element 1". The stab icon appears in the shape of a knife.', 2, 5),
		Line('You get no points and no effects.'),
		
		Line("You're probably thinking about simply performing the \"Draw\" action during the process.", 2, 6),
		Line('It is a double-edged sword, as there are both good and bad cards behind their face-down ones.'),
		Line('Same with the action of "Stab". It can be a safe way to play,'),
		Line("but you won't get much benefits after the ritual because the effects of the cards had been removed."),
	},
	[3] = {
		Line('Cards are the components that you will interact with most of the time.', 3, 1.1),
		Line('We "draw" cards to get points and rewards,'),
		Line('at the same time we "stab" cards to avoid getting negative effects from bad cards.'),
		Line('About the structure of the face up card:'),
		
		Line('the value of the card is located here ;', 3, 1.2),
		
		Line('The type of card is identified by the symbol, color and border color of it ;', 3, 1.3),
		
		Line('This is the image part of the card. You can also identify the card type by it ;', 3, 1.4),
		
		Line('Here is the back of the card. Every card has the same back.', 3, 1.5),
		Line('There are 3 main cardtypes.'),
		
		Line('The first main cardtype is element cards.', 3, 2.1),
		Line('Elemental cards: there are 4 subtypes. Consists of Fire, Air, Water, and Earth'),
		Line('- the 4 elements represent the composition of all things in alchemy.'),
		Line('They account for the most number, with the simple role of getting points.'),
		Line("Let's talk about how element cards be arranged in decks."),
		
		Line('For example, the current level has 8 elemental cards in 2 decks.', 3, 2.2),
		Line('Each subtype will have two cards, no more no less.'),
		
		Line('8 element cards will be randomly divided into two decks, like the example above.', 3, 2.3),
		
		Line('The second main cardtype is gold cards.', 3, 3.1),
		Line('Gold cards: there are 2 subtypes. Consist of gold cards and gold event cards.'),
		Line('(True names are Prima cards and Principle cards).'),
		Line('They have the positive role of getting bonus points (gold card) and upgrading rewards at the end of the level (gold event card).'),
		
		Line('Gold cards have the same way to be arranged in decks as element cards. ', 3, 3.2),
		
		Line('Gold event cards just have only 3 cards, with different names, on the level. They will be randomly devided into decks.', 3, 3.3),
		
		Line('The gold event card arrangement leads to unequal decks. Therefore, 1 gold card will be added to the missing deck.', 3, 3.4),
		
		Line('The third main cardtype is black cards.', 3, 4.1),
		Line('Black cards: there are 2 subtypes. Consist of black cards and black event cards.'),
		Line('(True names are Aether cards and Event cards).'),
		Line('They usually have the negative role of losing points (black card) and triggering bad effects during play (black event card).'),
		
		Line('Black cards, black event cards have the same way to be arranged in decks as element cards.', 3, 4.2),
		
		Line('Black event cards have a different amount depending on the level.', 3, 4.3),
		
		Line("It's hard to memorize them all.", 3, 5),
		Line('Try clicking Emerald Tablet'),
		
		Line('- and then click "Cardtypes/deck" to know what cardtypes and how many they are appearing on the current level.', 3, 5.2),
		Line('Additionally, there will not be many cardtypes appearing in the early levels.'),
	},
	[4] = {
		Line('The Hints represent the interactions between the current pair of face-down cards at the top of the deck.', 4, 1),
		
		Line('They help us guess the identity of that face-down card, as well as other ones.', 4, 1.5),
		
		Line('There are two types of Hints.', 4, 2),
		Line('The Circle Hint is about the type of hand between pairs of cards.'),
		
		Line('The Diamond Hint is about the value between pairs of cards.', 4, 2.5),
		Line('The detailed explanation of the cards will be in the following section.'),
		
		Line('About the hint circle: there are 3 symbols.', 4, 2),
		
		Line('Equal. When two cards have the same subtypes and have the same main cardtypes.', 4, 3.1),
		
		Line('Approximately. When two cards have different subtypes but have the same main cardtypes.', 4, 3.2),
		
		Line('Other. When two cards have different main cardtypes.', 4, 3.3),
		
		Line('About the diamond hint: there are 3 symbols.', 4, 2.5),
		
		Line('Big. When the left card has greater value than the right card.', 4, 4.1),
		
		Line('Little. When the left card has less value than the right card.', 4, 4.2),
		
		Line('Equal. When the left card has the same value as the right card.', 4, 4.3),
	},
	[5] = {
		Line('How to win a standard level?', 5, 1.1),
		Line('It is quite simple. Pay attention to the decks and the score frame.'),
		
		Line('When you draw all the decks and the score frame is not below 0, you win that level.', 5, 1.2),
		
		Line('At this point, the result board will appear with the score you have achieved.', 5, 1.3),
		
		Line('Conversely, if the score frame is below zero, whether you still have cards or not, you lose that level.', 5, 2.1),
		
		Line('At this point, the result board will still appear and announce that you lost.', 5, 2.2),
		
		Line('More about the result board.', 5, 3.1),
		Line('The reward icons will appear when you win.'),
		
		Line('Whether you win or lose, the following shortcuts will appear:', 5, 3.2),
		Line('Replay the current level ;'),
		
		Line('Level map shortcut ;', 5, 3.3),
		
		Line('tradings shortcut.', 5, 3.4),
	},
	[6] = {
		Line('The Flame Frames is used to announce the components of the cards that the player gets in the process.', 6, 1.1),
		
		Line("When a flame flares up, you know you've collected a component of a card.", 6, 1.2),
		
		Line('You can tell what component is by the position of the flame:', 6, 2.1),
		
		Line('The 4 Fire Frames in second row represent the 4 elements of the element main cardtype.', 6, 2.2),
		
		Line('The top 3 Fire Frames represent the 3 principles of gold event subtype, which are of the gold main cardtype.', 6, 2.3),
		
		Line('Talk in detail about the relationship between The Fire Frames and the rewards at the end of the level:', 6, 3.1),
		Line('A reward is generated when the player collects element flames, up to a maximum of 4.'),
		
		Line('When 4 element fire frames all flare up, they will suddenly go out.', 6, 3.2),
		Line('This indicates that you have just earned 4 elements.'),
		
		Line('The principle fire will not go out, it flares up until the end of the level.', 6, 3.3),
		Line('When you earn 3 principles flames, this indicates that the end-of-stage rewards will be upgraded.'),
		
		Line('here is a guide to get rewards based on flames obtained.', 6, 4),
		Line('Usually, the most valuable is gold, to the least is lead.'),
	},
	[7] = {
		Line('They are sub-components in the game, whose role is to support you in the process.', 7, 1),
		
		Line("Let's talk about The Emerald Tablet first.", 7, 2.1),
		
		Line('It plays the role of explaining from an overview of the mechanics, to the specifics of what is happening in the current level.', 7, 2.2),
		
		Line('Next are the equipment cards. Use them in the process to bring positive effects to the level.', 7, 3.1),
		Line('Sometimes your choices cause side effects.'),
		
		Line('You can customize the equipment cards you want before starting the level.', 7, 3.2),
		
		Line('Finally, the settings button. You can press it to pause the level.', 7, 4),
		
		Line('Those are all basic instructions for a novice alchemist.', 7, 5),
		Line("Let's practice a level to warm up your journey ahead."),
	},
}

function TutorialLevel:enter()
	State.initialize(self)

	self:fadeToBright()

	local warmUpUI = LevelUI(Sprites.levels.tutorial.warmUpUI, 'warmUp')

	self.frames = Manager(warmUpUI)

	self.icons = Manager(
			Icon(Sprites.levels.tutorial.t1.normal, Sprites.levels.tutorial.t1.hovered, 823, 1890, nil, dialogues[1]),
			Icon(Sprites.levels.tutorial.t2.normal, Sprites.levels.tutorial.t2.hovered, 1149, 1684, nil, dialogues[2]),
			Icon(Sprites.levels.tutorial.t3.normal, Sprites.levels.tutorial.t3.hovered, 840, 1480, nil, dialogues[3]),
			Icon(Sprites.levels.tutorial.t4.normal, Sprites.levels.tutorial.t4.hovered, 855, 1172, nil, dialogues[4]),
			Icon(Sprites.levels.tutorial.t5.normal, Sprites.levels.tutorial.t5.hovered, 1135, 978, nil, dialogues[5]),
			Icon(Sprites.levels.tutorial.t6.normal, Sprites.levels.tutorial.t6.hovered, 1072, 659, nil, dialogues[6]),
			Icon(Sprites.levels.tutorial.t7.normal, Sprites.levels.tutorial.t7.hovered, 789, 465, nil, dialogues[7]),
			Icon(Sprites.levels.tutorial.warmUp, nil, 954, 213, warmUpUI))
	
	self.camera = Camera.new()
	self.backgroundHeight = Sprites.levels.tutorial.levelMap:getHeight()
	self.halfScreenHeight = self.camera.y
	self.targetY = self.backgroundHeight - self.halfScreenHeight
	self.screenHeight = self.halfScreenHeight * 2
	self.smoother = Camera.smooth.linear(7360)
	
	self.returnButton = Button(Sprites.levels.tutorial.XButton, 1350, 100, 500, 500,
			function() self:fadeToDark(function() Gamestate.switch(World) end) end)
			
			
	if not Settings.hasEnteredTutorialLevel then
		Settings.hasEnteredTutorialLevel = true
		_dialogue:setNewLines(
				Line('The Great Work. It is the name of the alchemical ritual.', 4),
				Line("Its purpose is understandably to transform base metals (like lead) into noble metals (like gold)."),
				
				Line("These are some basic things to be familiar with how The Great Work works.", 1), 
				Line("Learn them and come back to me when you're finished."))
	end
end

function TutorialLevel:isAnyFrameActive()
	for _, frame in pairs(self.frames.entities) do
		if frame.isActive then return true end
	end
	return false
end

function TutorialLevel:_update(dt)
	self.frames:update(dt)
	
	if self:isAnyFrameActive() then return end

	self.icons:update(dt)
	
	local mouseX, mouseY = love.mouse.getPosition()
	if mouseY < 14 then
		self.targetY = self.targetY - scrollSpeed * dt
		self.targetY = math.max(self.targetY, self.halfScreenHeight)
	elseif mouseY > self.screenHeight - 14 then
		self.targetY = self.targetY + scrollSpeed * dt
		self.targetY = math.min(self.targetY, 2038 - self.halfScreenHeight)
	end
	self.camera:lockY(self.targetY, self.smoother)
	
	self.returnButton:update(dt)
end

function TutorialLevel:_draw()
	self.camera:attach()

	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(Sprites.levels.tutorial.levelMap)

	self.icons:draw()
	
	self.camera:detach()
	
	self.returnButton:draw()
	
	self.frames:draw()
end

function TutorialLevel:mousemoved(x, y)
	self.frames:mousemoved(x, y)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousemoved(worldX, worldY)
	
	self.returnButton:mousemoved(x, y)
end

function TutorialLevel:mousepressed(x, y, button)
	self.frames:mousepressed(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousepressed(worldX, worldY, button)
	
	self.returnButton:mousepressed(x, y, button)
end

function TutorialLevel:mousereleased(x, y, button)
	self.frames:mousereleased(x, y, button)
	
	if self:isAnyFrameActive() then return end

	local worldX, worldY = self.camera:mousePosition()

	self.icons:mousereleased(worldX, worldY, button)
	
	self.returnButton:mousereleased(x, y, button)
end

function TutorialLevel:wheelmoved(x, y)
	--if y > 0 then
		--self.targetY = self.targetY - wheelSpeed
		--self.targetY = math.max(self.targetY, self.halfScreenHeight)
	--elseif y < 0 then
		--self.targetY = self.targetY + wheelSpeed
		--self.targetY = math.min(self.targetY, 1570 - self.halfScreenHeight)
	--end
end

function TutorialLevel:keypressed(key, scancode, isRepeat)
	if key == 'escape' then
		Gamestate.switch(World)
	end
end

return TutorialLevel
