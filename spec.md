Specifications for the Rails Assessment
Specs:

Y   Using Ruby on Rails for the project
Y   Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
Y   Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
Y   Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
Y   The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
Y   Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Y   Include a class level ActiveRecord scope method (model object & class method name and URL to see the   working feature e.g. User.most_recipes URL: /users/most_recipes)
Y   Include login (how e.g. Devise)
Y   Include logout (how e.g. Devise)
Y   Include third party signup/login (how e.g. Devise/OmniAuth)
Y   Include nested resource show or index (URL e.g. users/2/recipes)
Y   Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
Y   Include form display of validation errors (form URL e.g. /recipes/new)
  Confirm:

   The application is pretty DRY
   Limited logic in controllers
   Views use helper methods if appropriate
   Views use partials if appropriate
