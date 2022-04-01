# CIS: Custom Ink Shortener

## Run the app: [https://ci-shorten.herokuapp.com/](https://ci-shorten.herokuapp.com/)

This is the URL shortener for the Custom Ink coding exercise. The requirements are:

* A [form that submits the URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/layouts/_hero.html.erb) to be shortened

* After submission, [displays the shortened URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb).

* When the user clicks on the shortened URL it should [expand to the full (original) URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb).


# Environment/Stack Details

* Ruby 3.1.1

* Ruby on Rails 7.0.2.3

* Bootstrap 5

* PostgreSQL

* [Hosted on Heroku](https://ci-shorten.herokuapp.com/)

* Hosted in a public GitHub repo: [https://github.com/kyletcarlson/CIS](https://github.com/kyletcarlson/CIS)



# A few things I learned:

* How to [initialize](https://github.com/kyletcarlson/CIS/blob/main/app/views/layouts/application.html.erb#L32), [enable HTML](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb#L9) inside of, and [work with](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_short_link_popover.html.erb#L1) Bootstrap 5 popovers

* More about [before_save](https://github.com/kyletcarlson/CIS/blob/main/app/models/short_link.rb#L3) callbacks

* How to use [database indexes](https://github.com/kyletcarlson/CIS/blob/main/db/migrate/20220401025409_add_uniqueness_and_required_to_short_links.rb) to enforce uniqueness constraints, and how to use HTML5 form validation

* More about [how to use Markdown](https://www.markdownguide.org/basic-syntax)



# A few things I struggled with/want to enhance:

* I tried for over an hour to implement a "copy to clipboard" function in the popover, but I couldn't get the <p> tag to recognize my onclick() function. 

* I implemented Ahoy! for analytics at the beginning because I thought I would use it. I ended up not, but I like having multiple sources of analytics in production applications.

* The UI could definitely use some work. I enjoy front-end development and is an element I'd like to improve upon, but it's definitely not a strong suit. Bootstrap 5 is my go to UI toolkit, and I like developing for mobile first. 

* I've used Kaminari in other apps for pagination. This app probably won't need it given the number of users who will be using it, but in a production app, I'd limit the number of links displayed at the bottom to maybe 10-20