#First iteration on sandwich parser
#Douglas Yan
#July 13, 2016#

require './sandwich'
require './extractor'

mySandwich = Sandwich.new
sandwichParts = Array.new

puts "What kind of sandwich do you want? "
myOrder = gets

#Extract Information
myExtractor = Extractor.new(myOrder.split)
myExtractor.extractData
sandwichParts = myExtractor.getSandwichComponents

#Build Sandwich
for i in 0...sandwichParts[0].length
	mySandwich.setProtein(sandwichParts[0][i])
end

for i in 0...sandwichParts[1].length
	mySandwich.setBread(sandwichParts[1][i])
end

for i in 0...sandwichParts[2].length
	mySandwich.setTopping(sandwichParts[2][i])
end

for i in 0...sandwichParts[3].length
	mySandwich.setCondiments(sandwichParts[3][i])
end

mySandwich.reviewSandwich

