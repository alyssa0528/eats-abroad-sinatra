Application that shows restaurants recommended by chefs in various cities. Chefs (users) can log in and submit restaurants they recommend in their own city.

Models:
CITY
*Associations:
- has_many :chefs, through: :chefs_restaurants
- has_many :restaurants, through: chefs
*Attributes:
- :name

CHEF (aka User)
*Associations:
- has_many :chefrestaurant
- has many :restaurants, through :chefrestaurant
- has_many :comments
*Attributes:
- :name
- :email
- :password

RESTAURANT:
*Associations:
- has_many :chefrestaurant
- has_many :chefs, through: :chefrestaurant
- belongs_to :city
*Attributes:
- name
- cuisine
- city_id

CHEFRESTAURANT (join table):
*Associations:
- belongs_to :chef
- belongs_to :restaurant

COMMENTS:
*Associations:
- belongs_to :chef
- belongs_to :restaurant
*Attributes:
- content
- chef_id
- restaurant_id

 
Restful Routes:

MAIN:
GET ‘/’ => root page; welcomes user, asks if they want to sign up or log in


CITY:
Brief notes:
-	We want a list of cities to be viewable (via /cities) and have logged-in users view the recommended restaurants in each city.
-	The ID will be a slug in the URL.
-	**For this app, the only way a new city can be added is via the chef sign-up form.  There will be no separate erb view for a new city form.
-	**Cities cannot be edited or deleted by anyone.

GET ‘/cities’ => shows all cities

GET ‘/cities/new’ => display create new city form (POSSIBLY DON’T NEED, HAVE NEW CITY ADDED IN CHEF SIGN UP FORM)

POST ‘/cities’ => create new city

GET ‘/cities/:id’ => HAVE ID BE CITY SLUG; display one city and its chefs and recommended restaurants

GET ‘/cities/:id/edit’ => show form edit a city (POSSIBLY DON’T NEED)

PATCH ‘/cities/:id’ => edit a city (AGAIN, POSSIBLY DON’T NEED)

DELETE ‘/cities/:id/delete’ => delete a city (LIKELY DON’T NEED THIS FUNCTION)


CHEF:
Brief notes:
-	A chef can sign up and log in.
-	A chef can select restaurants, and add recommended restaurants and recommendation comments. (He will have many restaurants and have many comments.)
-	** A chef cannot edit or delete his account.

GET ‘/signup’ => show sign up form

POST '/signup', redirect to '/restaurants' => show list of all restaurants

GET ‘/login’ => show login screen

POST ‘/login’, redirect to '/restaurants' => show list of all restaurants and their cities

GET ‘/chefs/:id => display a specific chef, their recommended restaurants, and their comments for each restaurant; make :id a slug of the chef’s name

GET ‘/chefs/:id/edit’ => display edit form for chef’s profile (NOT NEEDED)

PATCH ‘/chefs/:id’ => updates the chef’s profile (NOT NEEDED)

DELETE ‘/chefs/:id/delete’ => deletes a specific chef. (NOT NEEDED)


RESTAURANT:
Brief notes:
-	Restaurants can be added by a chef if it doesn't already exist
- Restaurants' name, cuisine, and city can't be edited by a chef once created (only an "admin" can, which is not created for the purposes of this project)
-	Restaurants can be disassociated from a chef (but cannot be deleted from the database by a chef)

GET ‘/restaurants’ => shows all recommended restaurants by city

GET ‘/restaurants/new’ => show form to add new recommended restaurant (only if chef is logged in)

POST ‘/restaurants’ => create new recommended restaurant

GET ‘/restaurants/:id’ => HAVE ID BE RESTAURANT SLUG; display a restaurant, its cuisine, and who recommended it

GET ‘/restaurants/:id/edit’ => show edit form; let the chef edit the restaurant (only by adding/editing a note, recommended dish)

PATCH ‘/restaurants/:id’ => show newly updated restaurant

DELETE ‘/restaurants/:id/delete’ => let a chef delete a restaurant he had recommended


COMMENT:
Brief notes:
- Comments can be created, edited, or deleted by a chef
- No separate comment views will be made. They will be visible in the '/restaurant/:id' view


chef.comments => shows all of a chef's comments
chef.restaurants => shows all of a chef's favorite restaurants (therefore keep join table)

restaurant.city => shows restaurant's city
city.restaurants => show the city's restaurants
