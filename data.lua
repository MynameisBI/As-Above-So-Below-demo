return {
	base = {
		'b', 'be',
	},
	mixed = {
		'ge', 'ge', 'ge',
		'g', 'g', 'g', 'g', 'g',
		'f1', 'f2', 'f3', 'f4',
		'w1', 'w2', 'w3', 'w4',
		'e1', 'e2', 'e3', 'e4',
		'a1', 'a2', 'a3', 'a4',
	},
	
	cardClasses = {
		f1 = {
			name = 'Fire 1',
			value = 1,
			group = 'element',
			type = 'fire',
			sprite = 'fire',
		},
		f2 = {
			name = 'Fire 2',
			value = 2,
			group = 'element',
			type = 'fire',
			sprite = 'fire',
		},
		f3 = {
			name = 'Fire 3',
			value = 3,
			group = 'element',
			type = 'fire',
			sprite = 'fire',
		},
		f4 = {
			name = 'Fire 4',
			value = 4,
			group = 'element',
			type = 'fire',
			sprite = 'fire',
		},

		w1 = {
			name = 'Water 1',
			value = 1,
			group = 'element',
			type = 'water',
			sprite = 'water',
		},
		w2 = {
			name = 'Water 2',
			value = 2,
			group = 'element',
			type = 'water',
			sprite = 'water',
		},
		w3 = {
			name = 'Water 3',
			value = 3,
			group = 'element',
			type = 'water',
			sprite = 'water',
		},
		w4 = {
			name = 'Water 4',
			value = 4,
			group = 'element',
			type = 'water',
			sprite = 'water',
		},

		e1 = {
			name = 'Earth 1',
			value = 1,
			group = 'element',
			type = 'earth',
			sprite = 'earth',
		},
		e2 = {
			name = 'Earth 2',
			value = 2,
			group = 'element',
			type = 'earth',
			sprite = 'earth',
		},
		e3 = {
			name = 'Earth 3',
			value = 3,
			group = 'element',
			type = 'earth',
			sprite = 'earth',
		},
		e4 = {
			name = 'Earth 4',
			value = 4,
			group = 'element',
			type = 'earth',
		},

		a1 = {
			name = 'Air 1',
			value = 1,
			group = 'element',
			type = 'air',
			sprite = 'air',
		},
		a2 = {
			name = 'Air 2',
			value = 2,
			group = 'element',
			type = 'air',
			sprite = 'air',
		},
		a3 = {
			name = 'Air 3',
			value = 3,
			group = 'element',
			type = 'air',
			sprite = 'air',
		},
		a4 = {
			name = 'Air 4',
			value = 4,
			group = 'element',
			type = 'air',
			sprite = 'air',
		},

		g = {
			name = 'Gold 4',
			value = 4,
			group = 'gold',
			type = 'gold',
			sprite = 'gold',
		},
		ge = {
			name = 'Gold Event 0',
			value = 0,
			group = 'gold',
			type = 'gold event',
			triValue = 1,
			sprite = 'gold',
		},
		b = {
			name = 'Black 4',
			value = 4,
			score = -4,
			group = 'black',
			type = 'black',
			sprite = 'black',
		},
		be = {
			name = 'Black Event 0',
			value = 0,
			group = 'black',
			type = 'black event',
			event = function(self, deck)
				deck:stab('self', 2)
			end,
			sprite = 'black',
		},
	},
}
