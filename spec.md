# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
      User has many businesses
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      Business belongs to a category and belongs to a user
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      A business has many products through businesses_products and vice versa, a product has many tags through products_tags and vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      businesses_products includes a user submittable product_rating attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      A category must have a name and be unique; products, tags, and businesses must have names
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      Recently Added Businesses on Home Page
- [x] Include signup (how e.g. Devise)
      Signup via Devise
- [x] Include login (how e.g. Devise)
      Login via Devise
- [x] Include logout (how e.g. Devise)
      Logout via Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      Omniauth via Devise and Google oauth2
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      Products nested under businesses
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      Products nested under businesses
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      Form Errors partial included on forms

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
