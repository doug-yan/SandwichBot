#First iteration on sandwich parser
#Douglas Yan
#July 13, 2016

#order: protein, bread, toppings, condiments

class Extractor
	@proteins
	@bread
	@toppings
	@condiments

	@ordered_P
	@ordered_B
	@ordered_T
	@ordered_C

	@orderedItems

	def initialize(order)
		@proteins = ["turkey", "ham", "chicken", "bacon"]
		@bread = ["white", "wheat", "rye", "sourdough"]
		@toppings = ["lettuce", "tomato", "onion", "spinach", "jalapenos", "pepporcini"]
		@condiments = ["mayo", "mustard", "pesto"]
		@sandwichComponents = [@proteins, @bread, @toppings, @condiments]

		@ordered_P = Array.new
		@ordered_B = Array.new
		@ordered_T = Array.new
		@ordered_C = Array.new
		
		@sandwichOrder = Array.new
		@orderedItems = Array.new
		@orderedItems = order
	end

	def extractData
		for i in 0...@orderedItems.length()
			found = false
			k = 0
			while found == false and k < 4
				word = @orderedItems[i]
				lastChar = word[word.length - 1]

				if lastChar == ',' or lastChar == '.'
					found = checkForKeyword(@orderedItems[i].chop, @sandwichComponents[k])
				else
					found = checkForKeyword(@orderedItems[i], @sandwichComponents[k])
				end

					k += 1
			end
		end
	end

	def checkForKeyword(keyword, wordbank)
	 	for i in 0...wordbank.length()
			if wordbank[i] == keyword
				case wordbank[0]
					when "turkey"
						@ordered_P.push(keyword)
					when "white"
						@ordered_B.push(keyword)
					when "lettuce"
						@ordered_T.push(keyword)
					when "mayo"
						@ordered_C.push(keyword)
				end
				return true
			end
		end	

		return false
	end

	def getSandwichComponents
		@sandwichOrder.push(@ordered_P)
		@sandwichOrder.push(@ordered_B)
		@sandwichOrder.push(@ordered_T)
		@sandwichOrder.push(@ordered_C)
		
		puts "Here are the sandwich parts: #{@sandwichOrder}"
		return @sandwichOrder	
	end

end
