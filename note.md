# 2 Configure application
## Install bootstrap with yarn and webpacker

[blog corsego](https://blog.corsego.com/rails-6-install-bootstrap-with-webpacker-tldr)

[github](https://github.com/twbs/bootstrap-rubygem)


## Install FontAwesome with Yarn and Webpacker

[blog corsego](https://blog.corsego.com/rails-6-install-fontawesome-with-webpacker)

## respnoseive screen width

# 3 buiding the MVP (minimum viable product)

## static_pages/lading_page VS home/index

Chapter 2 and Chapter 3 have a minor discrepancy:

In Chapter 2 Lecture "hello world - generate a static page" we create static_pages/landing_page, whereas in Chapter 3 we use home/index.

To use home/index, we just need to run:

rails g controller home index

and set in routes.rb:

```
Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
end
```

## Gem haml-rails - friendly way of edditing HTML

[html_to_haml](https://ovdss.com/iapps/html_to_haml)

[github](https://github.com/corsego/corsego/commit/939a008198b98c42af6c7635252aba87bc65fc21)

## Gem simple-from -better way to work with forms

[github](https://github.com/corsego/corsego/commit/9a4030d685be9be896ed92ef86124a65672b30f8)

```
// Gemfile
gem 'simple_form'
 
// Console
bundle install
rails generate simple_form:install
or
rails generate simple_form:install --bootstrap
 
// Any form can look something like
= simple_form_for @course do |f|
  = f.error_notification
  = f.error_notification message: f.object.errors[:base].to_sentence if f.object.errors[:base].present?
  = f.input :title
  = f.label :description
  = f.rich_text_area :description
  /= f.submit 'Save'
  = f.button :submit
```

## add a courses table

[github](https://github.com/corsego/corsego/commit/79eefae10dc193bdd50c5f686fcf15cd5a300f28)

[guides](https://guides.rubyonrails.org/v3.2/getting_started.html#getting-up-and-running-quickly-with-scaffolding)

```
*Console*
rails generate scaffold Course title:string description:text
rake db:migrate
// course.rb
validates :title,  presence: true
validates :description, presence: true, length: { :minimum => 5 }
```

## action_text - rich text editor

handle rich text content in applications

[action_text](https://edgeguides.rubyonrails.org/action_text_overview.html)

[github](https://github.com/corsego/corsego/commit/28ee2e18adb85b8805752ffde17817971c8c1c03)

```
Current best approach to install action_text:

console:

action_text:install
in course.rb

has_rich_text :description
console - create folder app/javascript/stylesheets :

mkdir app/javascript/stylesheets
create file app/javascript/stylesheets/actiontext.scss:

@import 'trix/dist/trix';
app/javascript/stylesheets/application.scss

@import './actiontext.scss';
app/javascript/packs/application.js', before: 'require("trix")'

require('stylesheets/application.scss')
IMPORTANT: the length validation does not work on a rich text field.
```

## gem faker and seeds.rb - add fake data to the app

[github](https://github.com/corsego/corsego/commit/07ce75da3579cfb57d2b5c25a4e49196dc6d4515)

[gem faker-ruby](https://github.com/faker-ruby/faker)


```
// Gemfile
gem 'faker'
 
// seeds.rb
30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote
  }])
end
 
// Console
bundle
rails db:seed
```

## gem devise for authentication (login, logout)

[github](https://github.com/corsego/corsego/commit/0d1b36774f9eaa6faa75e48ee2aa4ce8c941b98d)

- relationships
[github](https://github.com/corsego/corsego/commit/b9e427a64f61b67f05b0f51978b58ccb1d89c840 )

- design message
[github](https://github.com/corsego/corsego/commit/2327a94c45e3b89b994ef1a577ad0e623968017a )

[navigation-for-devise](https://blog.corsego.com/navigation-for-devise)

## adding a function navbar

[github](https://github.com/corsego/corsego/commit/898c377848c00ea247fa1c678bc4dabca065cd64)


## search field in navbar

[github](https://github.com/corsego/corsego/commit/1516db4021c2b1701ef1cc1ee2ef51ab72f919ad)

## styling course and home index

[github](https://github.com/corsego/corsego/commit/726cefa5d4f84f60a2950110d46fc26aee0190e1)

## gem friendly_id - show user frieldly links

-readable human-readable, SEO-friendly URLs by replacing the default numeric IDs in URLs

[github](https://github.com/corsego/corsego/commit/ff4d418c3aed930e12e5b265131b08220c3b8965)

## devise trackable (track user IP address, create users index page)

[github](https://github.com/corsego/corsego/commit/2d0787ffa85774c18b8a2efd1a1a770f7088dbac)

## devise confirmable in development

[github](https://github.com/corsego/corsego/commit/57b730522f41bd053c65fe6b46c08233f8b13cbf)

[github](https://github.com/corsego/corsego/commit/beb00e6aef326f461d2efb8fedb5037699d1f5f1)

[How To: Add :confirmable to Users](https://github.com/heartcombo/devise/wiki/How-To:-Add-:confirmable-to-Users)

[Action Mailer Basics](https://guides.rubyonrails.org/action_mailer_basics.html)

## sendgrid - send emails in production

SendGrid is a cloud-based email delivery service

[github](https://github.com/corsego/corsego/commit/521e1a592bd191aebdab1bfca5672d0a2629ff3a)

## AWS SES - better way to send emails in production

## add more fields to course

[github](https://github.com/corsego/corsego/commit/ab85755925111afba6ef06382823c639bfa48276)

## gem sansack level 1 - fillter and search data in a table

to build complex search forms and filters for Active Record objects

[tutorial](https://activerecord-hackery.github.io/ransack)

[github](https://github.com/corsego/corsego/commit/83d539133b819ad759a7da71b3cfc9d2e767dc7e)

## gem sansack level 2 - fillter and search course

[github](https://github.com/corsego/corsego/commit/3967698f0930528f48752c68092cc3aa567aaef6)

## level 3 - ransack search in navbar

[github](https://github.com/corsego/corsego/commit/ff48a029d0a0f4f5ad0e001e89fe1362d09952a3)

## gem [public_activity](https://github.com/public-activity/public_activity) track all actions in the app

[github](https://github.com/corsego/corsego/commit/4ec2490e0f6d090c35e5f379d2d514d4c2164a3a)

# 4.Roles and Authorization

## gem [rolify](https://github.com/RolifyCommunity/rolify) - create roles

[github](https://github.com/corsego/corsego/commit/04b2dc35eb45f9b2701b590ae7861da688937987)













