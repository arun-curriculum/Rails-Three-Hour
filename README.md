#Introduction to Ruby on Rails

##Install Software

####Install RVM

`\curl -sSL https://get.rvm.io | bash -s stable`

####Install Ruby

`rvm install ruby --disable-binary`

####Check Installation

`ruby -v`

####Install Rails

`gem install rails`

##Group Exercise
- Think of a typical web request cycle. What happens between browser and server?
- Talk about this in small groups and share back to the class.
- Draw out a simple diagram of how the process works.

##What is Ruby?
- Ruby is an interpreted language that is considered a "back-end" language.
- It is object oriented, and is often coupled with the popular MVC framework Ruby on Rails.

##The Ruby Language

- To practice using Ruby we can use the Interactive Ruby (IRB) tool.
- Everything is an object.
- Everything that is manipulated is an object, and the results of those manipulations are objects.
- In Ruby everything is an object and you'll be able to use object methods on it all.

Let's take a look at some examples:

```
puts "Arun Sood".length
puts "Arun".index("A")
puts 35.even?
```

- We can tell that everything is an object, because everything has a "class":

```
"Arun Sood".class #String
4.class #Fixnum
[].class #Array
Object.class #Class
```

- Something like this `message = "Hello World"` is essentially the equivalent of `message = String.new("Hello World")`.

- There is little conversion of type:

```
puts "Hello " + 4 + 2 #no implicit conversion of Fixnum into String
```

##Modules Versus Objects

####Modules
- Modules are like libraries.
- Usually used for containing a bunch of "helper" functions that you can call throughout your program.
- Great example is the [Math module](http://www.ruby-doc.org/core-2.1.4/Math.html) built into Ruby:

```
Math.sqrt(9) #3.0
```

####Objects
- Ruby is a proper object-oriented language.
- "Classes" wrap methods that are related to that object.
- Classes can also inherit from other classes - this is called extension. We will get to this later.

```
class Car
	def initialize(color, make, model)
		@color = color
		@make = make
		@model = model
	end
	
	def drive
		puts "We are now driving!"
	end
	
	def paint(new_color)
		@color = new_color
		puts @color
	end
	
	def describe_car
		puts "We are driving in the #{@color} #{@make} #{@model}"
	end
end

Car.new("Red", "Honda", "Civic").paint("Blue")
```

##Control Flow in Ruby
- Controlling the flow of your application is crucial because it allows you to perform actions only under certain conditions.
- Control flow often involves the use of "conditional" statements such as `if` - `else` blocks and the use of loops such as `for` and `while`.

####`if` statements

```ruby
yes =  true

if yes
	puts "Indeed!"
end
```

####`if` - `else` blocks:

```ruby
name = "Arun"
if name == "Bob"
	puts "Hello Bob"
elsif name == "John"
	puts "Hello John"
else
	puts "Hello Someone"
end
```

- Code inside a block is only executed when the condition is met.
- By condition being met, we mean that the statement returns `true`.

##Rails from the Rails People

"Ruby on Rails is an open-source web framework that's optimized for programmer happiness and sustainable productivity.

It lets you write beautiful code by favoring convention over configuration."

##What Rails Includes

Rails wraps in a bunch of functionality right out of the box:
- MVC programming pattern convention
- Templating engine
- ORM called ActiveRecord
- Support for developing APIs with token authentication, namespacing, and multiple response types.
- A database already wrapped in called SQLite3
- An asset pipeline for managing static assets like stylesheets, javascript files, and images.
- Asset "uglifier" or "minifier".
- SASS support
- CoffeeScript support
- Built-in testing suite called MiniTest.
- Authentication flow with Bcrypt and has_secure_password.
- Development web server called WEBrick.
- EASY PEEZY extension of functionality through community-supported gems.
- Oh and sessions... Yeah that's a big one!

##MVC Pattern Coding

####Models
- Models are where data interactions happen.
- You will often see logic related to pulling and saving to databases here.

####Views
- Views are what the users will actually see.
- It is the UI made dynamic through the templating engine.
- Views in Rails are served through layouts.

####Controllers
- Controllers bridge the gap between models and views.
- They take requests and do something with them.
- One controller can have many methods relating to that specific logical concern.

####Routes
- Like Node, routes take HTTP requests from a specific URL and hand them off to a specific controller and a specific method inside that controller.

##Rails Command Line Interface
- Allows you to create new projects.
- You can easily generate new components of your project.
- Easily destroy aspects of your application that you no longer need.
- Three tools we will see a lot:

Rails New:

```
rails new HelloWorld
```

Rails Generate:

```
rails generate controller Hello
```

Rails Destroy:

```
rails destroy controller Hello
```

Rails Console:

```
rails console
```

Rails Server:

```
rails server -p 3000
```

Rails DB:

```
rails db
```

RAKE:

```
rake db:migrate
```

##Hello World in Rails

What it's gonna take:
- A controller with a method
- A route
- A view
- Running server

Let's do it!

##Asset Pipeline
- Rails wraps in a software called Sprockets that allows you to include multiple static assets in your application.
- Sprockets also handles the SASS and CoffeeScript interpretation as well as the uglifier.
- You can read about Sprockets [here](https://github.com/rails/sprockets-rails).

##Using the Asset Pipeline
- For the basic implementation, all that is needed is for you to place any stylesheets, javascripts, and images in their appropriate folders under app/assets.
- For stylesheets, you can find the asset require code in app/assets/stylesheets/application.css:

```
*= require_tree .
*= require_self
```

- For javascripts, you can find the asset require code in app/assets/javascripts/application.js:

```
//= require turbolinks
//= require_tree .
```

- You will also find a folder called `vendor` at the root of your application. This folder is where you should keep any code written by third parties such as jQuery or Bootstrap.
- To make this work however you will have to alter your application.css and application.js files a bit:

application.css

```
*= require_tree ../../../vendor/assets/stylesheets/
```

application.js

```
//= require_tree ../../../vendor/assets/javascripts/
```

##Models
- Models contain code that performs data operations.
- Such operations may be retrieving a list of users, adding a new user, updating an existing user, and deleting a user.
- Each model encapsulates data about a specific object. An example may be a user here.
- Model methods are normally invoked on the controller side.
- Let's go over a few common operations in terms of a user:

####Generate a new user model

```
rails generate model User firstname:string lastname:string email:string
```

####After a new model is created, the database must be migrated to reflect the new changes

```
rake db:migrate
```

####Create a new user

```
User.create(firstname: "Arun", lastname: "Sood", email: "arun@email.com")
```

####List all users in the database

```
User.all
```

####Get information about a specific user

```
User.find(id of user here)
```

####Update a user

```
User.find(id of user).update_attributes(firstname: "Arun", lastname: "Sood", email: "arun@email.com")
```

####Delete a user

```
User.find(id of user).destroy
```

- Let's try this together in the Rails console.

##In-Class Lab: Chirp!
- Chirp! is the latest and greatest in terms of social networking.
- You will create a simple app that mimics Twitter, with users writing short little posts.
- You can find the starter project [here](chirp_network/).
- Steps:
	- Step 1: Generate your Chirp model. Give it one attribute - chirp:string.
		- You can feel free to practice the "CRUD" operations in the Rails console before continuing if you like.
	- Step 2: Open up your routes file and enter the line `resources :chirps`.
	- Step 3: Open controllers/chirps_controller.rb. Replace each comment (in gray) with the proper code.
	- Step 4: Place all the assets in the [chirp_assets](chirp_assets/) folder in the proper project folders.
	- **Bonus:** Have a look at the will_paginate gem online [here](https://github.com/mislav/will_paginate). Try to follow the instructions to install and use pagination on your chirp homepage.

##Deploy Chirp! to Heroku
- Heroku is a cloud hosting platform that makes it easy to deploy and scale Rails applications.
- Let's sign up for a free account [here](https://www.heroku.com/).
- We will also need to download and install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

####Step 1: Login to Heroku via the terminal
- Open up a terminal and type `heroku login`.
- You should now be signed in and won't have to repeat this step moving forward.

####Step 2: Create a new app

```
heroku create
```

####Step 3: Push to Heroku's Git repository
- Heroku uses Git to automate the deployment process.
- All you have to do is type the command:

```
git push heroku master
```