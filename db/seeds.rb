City.create(name: "Chicago") #id 1
City.create(name: "Vancouver") #id 2
City.create(name: "Boston") #id 3
City.create(name: "Dublin") #id 4

Chef.create(name: "Rick Bayless", email: "rick@bayless.com", password: "food") #id 1
Chef.create(name: "Mindy Segal", email: "mindy@segal.com", password: "food") #id 2
Chef.create(name: "Thomas Haas", email: "thomas@haas.com", password: "food") #id 3
Chef.create(name: "Alex Chen", email: "alex@chen.com", password: "food") #id 4
Chef.create(name: "Joanne Chang", email: "joanne@chang.com", password: "food") #id 5
Chef.create(name: "Cassie Piuma", email: "cassie@piuma.com", password: "food") #id 6
Chef.create(name: "Kevin Arundel", email: "kevin@arundel.com", password: "food") #id 7
Chef.create(name: "Sandy Wyer", email: "sandy@wyer.com", password: "food") #id 8

#chicago
Restaurant.create(name: "HotChocolate", cuisine: "desserts", city_id: 1) #id 1
Restaurant.create(name: "Tortas Frontera", cuisine: "Mexican", city_id: 1) #id 2
Restaurant.create(name: "Fat Rice", cuisine: "Macanese", city_id: 1) #id 3
Restaurant.create(name: "Pequod's", cuisine: "pizza", city_id: 1) #id 4
#vancouver
Restaurant.create(name: "Thomas Haas Chocolates & Patisserie", cuisine: "desserts", city_id: 2) #id 5
Restaurant.create(name: "Le Crocodile", cuisine: "French", city_id: 2) #id 6
Restaurant.create(name: "Phnom Penh", cuisine: "Cambodian", city_id: 2) #id 7
Restaurant.create(name: "Bao Bei", cuisine: "Chinese", city_id: 2) #id 8
#Boston
Restaurant.create(name: "Myers + Chang", cuisine: "Asian", city_id: 3) #id 9
Restaurant.create(name: "Sweet Cheeks", cuisine: "Southern", city_id: 3) #id 10
Restaurant.create(name: "Cafe Sushi", cuisine: "Japanese", city_id: 3) #id 11
Restaurant.create(name: "Picco", cuisine: "ice cream", city_id: 3) #id 12
#dublin
Restaurant.create(name: "777", cuisine: "Mexican", city_id: 4) #id 13
Restaurant.create(name: "Balfes Bar & Brasserie", cuisine: "Irish", city_id: 4) #id 14
Restaurant.create(name: "The Greenhouse", cuisine: "modern Irish", city_id: 4) #id 15
Restaurant.create(name: "Toners", cuisine: "pub", city_id: 4) #id 16


#chicago
Comment.create(content: "Whenever there’s a celebration at my house, there’s usually a cake by Mindy [from HotChocolate].", chef_id: 1, restaurant_id: 1)
Comment.create(content: "I really like Rick Bayless’ Tortas Frontera restaurant in Terminal 3 at O’Hare.", chef_id: 2, restaurant_id: 2)
Comment.create(content: "The rice noodles with the XO sauce. Delicious!", chef_id: 2, restaurant_id: 3)
Comment.create(content: "It’s refreshing to see chefs tackle a cuisine that is so unexplored – in this case, Macanese. The signature dish, Arroz Gordo, is a must.", chef_id: 1, restaurant_id: 3)
Comment.create(content: "I don't eat a lot of deep dish, but I think Pequod's makes a good one.", chef_id: 1, restaurant_id: 4)
#Vancouver
Comment.create(content: "For breakfast, I would start with the double-baked almond croissant from Thomas Haas Chocolates & Patisserie. It’s one of my favorite things to have when I’m craving a treat.", chef_id: 4, restaurant_id: 5)
Comment.create(content: "You can’t beat their Alsacian-style apple tart or their classic soufflé!", chef_id: 3, restaurant_id: 6)
Comment.create(content: "For dinner, there’s nothing like Le Crocodile, which is one of my family’s favorite spots for traditional French fare.", chef_id: 4, restaurant_id: 6)
Comment.create(content: "This Cambodian restaurant offers truly delicious and authentic Southeast Asian favorites like pho, trieu chau steamed dumplings and spicy garlic seafood options.", chef_id: 4, restaurant_id: 7)
Comment.create(content: "Bao Bei‘s mantou (pork belly on a Chinese steamed bun) is at the top of my list. I could eat 10 … or 20.", chef_id: 3, restaurant_id: 8)
#Boston
Comment.create(content: "My favorite M+C dish is our salmon head and tail with black bean sauce, miso fried rice and garlicky green beans.", chef_id: 5, restaurant_id: 9)
Comment.create(content: "Indonesian fried rice, Mama Chang’s pork dumplings, Hakka eggplant, green papaya salad.", chef_id: 6, restaurant_id: 9)
Comment.create(content: "Sweet Cheeks for fried chicken, biscuits and green tomatoes. The biscuits are the size of your fist and down right decadent.", chef_id: 6, restaurant_id: 10)
Comment.create(content: "They have a changing signature sampler and chef’s sampler. I get both every time we go.", chef_id: 5, restaurant_id: 11)
Comment.create(content: "Chef’s choice at Cafe Sushi.", chef_id: 6, restaurant_id: 11)
Comment.create(content: "The chocolate sorbet at Picco. It’s like eating the best bittersweet chocolate bar, but frozen.", chef_id: 5, restaurant_id: 12)
#Dublin
Comment.create(content: "My guilty pleasure would be the tacos in 777 restaurant, washed down by a very good house marguerite.", chef_id: 7, restaurant_id: 13)
Comment.create(content: "777 does amazing Mexican food and brilliant margaritas.", chef_id: 8, restaurant_id: 13)
Comment.create(content: "An oasis of tranquility in the city center. We would read the paper and drink sidecars!", chef_id: 8, restaurant_id: 14)
Comment.create(content: "The passionfruit soufflé with white chocolate sauce – sublime!", chef_id: 7, restaurant_id: 15)
Comment.create(content: "Exceptional wines and service, more on the high end side of things.", chef_id: 8, restaurant_id: 15)
Comment.create(content: "For a great pint in true Dublin style. The best pint of Guinness!", chef_id: 7, restaurant_id: 16)
