# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = Category.new code: 'codigo', description: 'pedropicapiedra@gmail.com'
category.save!

user = User.new name: 'Pedro', email: 'pedropicapiedra@gmail.com', password: '123456'
user.save!

post = Post.new title: 'Un nuevo post!', content: 'Contenido de ejemplo', date: Date.new
post.user = user
post.category = category
post.save!

comment = Comment.new text: 'Hola soy un comment', date: Date.new
comment.post = post 
comment.user = user 
comment.save 