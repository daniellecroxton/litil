Rails App

Models
User
	Name
	Password
	Email
	Business (optional, has many)
Business
	Address
	Website
	Products
	Phone
	Tags (has many through Products)
	Category (belongs to)
	Image?
	User (optional, belongs to)
	Rating?
Products
	Tags (has many)
	Business_id
Category
	Business (has many)
Tag
	Products (has many)
	Business (has many through Products)
ProductsTags
	Tag_Id
	Products_Id
BusinessProduct
	Products_Id
	Business_Id

Description
  A directory of small retailers that allows the public to view small business by location, category, product, or tag. People can also sign up to claim a business, add a business, or add tags.

  Questions
  	Can users businesses be on user show page?
  	Nested Forms for tags? Products?
  	Any suggestions on preparing to talk about code?

  Scope Methods
  	Recently Added Shops
  	Nearby Shops (Find by location)

	Images
		Paperclip gem

Name Ideas
	•	Across the Street
	•	Corner Store
	•	Next Door
	•	Market
	•	Establishment
	•	Minicorp
	•	Shop Nearby
	•	Bazaar
	•	Marketplace
	•	Shops Near Me
	•	Mini Mart
	•	Littil
	•	Market Register
	•	The Boulevard
	•	Pierpont Place
	•	Merchandise
