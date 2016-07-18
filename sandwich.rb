#First iteration on sandwich parser
#Douglas Yan
#July 13, 2016

class Sandwich
	@owner
	@bread
	@protein
	@numProtein
	@toppings
	@numToppings
	@condiments
	@numCondiments

	def initialize
		@owner = "none"
		@bread = "none"
		@protein = Array.new
		@numProtein = 0
		@toppings = Array.new
		@numToppings = 0
		@condiments = Array.new
		@numCondiments = 0
	end

	def setOwner(name)
		@owner = name
	end

	def setBread(breadChoice)
		@bread = breadChoice
	end

	def setProtein(proteinChoice)
		@protein[@numProtein] = proteinChoice
		@numProtein += 1
	end

	def setTopping(toppingChoice)
		@toppings[@numToppings] = toppingChoice
		@numToppings += 1
	end

	def setCondiments(condimentChoice)
		@condiments[@numCondiments] = condimentChoice
		@numCondiments += 1
	end	

	def reviewSandwich
		proteinStr = String.new(" ")
		toppingStr = String.new(" ")
		condimentStr = String.new(" ")

		for i in 0...@numProtein
			proteinStr << @protein[i]
			if @numProtein != 1
				if @numProtein != 2
					proteinStr << ", "
				end
				
				if i == @numProtein - 2
					proteinStr << " and "
				end
			end
		end 

		for i in 0...@numToppings
			toppingStr << @toppings[i]

			if @numToppings != 1
				if @numToppings != 2
					toppingStr << ", "
				end

				if i == @numToppings - 2
					toppingStr << " and "
				end
			end
		end

		for i in 0...@numCondiments
			condimentStr << @condiments[i]
			
			if @numCondiments != 1
				if @numCondiments != 2
					condimentStr << ", "
				end

				if i == @numCondiments - 2
					condimentStr << " and "
				end
			end
		end

		puts "#{@owner}'s sandwich is a#{proteinStr} sandwich with#{toppingStr} and#{condimentStr}."
	end
end
