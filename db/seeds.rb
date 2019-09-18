# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
# [[1, "Cheap"], [2, "Expensive"], [3, "Alien"], [4, "Human"]]

# [
# [3, "Yamcha", 0.2e3], 
# [6, "Gohan(Child)", 0.2e4], 
# [2, "Tien", 0.15e3], 
# [5, "Piccolo", 0.25e4], 
# [7, "Gohan(Adult)", 0.125e5], 
# [1, "Farmer", 0.3e1], 
# [10, "There", 0.1e3]
# ]

ProductCategory.create(product_id: 1, category_id: 1)
ProductCategory.create(product_id: 1, category_id: 4)
ProductCategory.create(product_id: 2, category_id: 1)
ProductCategory.create(product_id: 2, category_id: 4)
ProductCategory.create(product_id: 3, category_id: 1)
ProductCategory.create(product_id: 3, category_id: 4)

ProductCategory.create(product_id: 5, category_id: 2)
ProductCategory.create(product_id: 5, category_id: 3)

ProductCategory.create(product_id: 6, category_id: 2)
ProductCategory.create(product_id: 6, category_id: 4)

ProductCategory.create(product_id: 7, category_id: 2)
ProductCategory.create(product_id: 7, category_id: 4)

ProductCategory.create(product_id: 10, category_id: 2)