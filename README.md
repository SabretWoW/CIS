# CIS: Custom Ink Shortener

## Run the app: [https://ci-shorten.herokuapp.com/](https://ci-shorten.herokuapp.com/)

This is the URL shortener for the Custom Ink coding exercise. The requirements are:

* A [form that submits the URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/layouts/_hero.html.erb) to be shortened

* After submission, [displays the shortened URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb).

* When the user clicks on the shortened URL it should [expand to the full (original) URL](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb).


# Environment/Stack Details

* [Ruby 3.1.1](https://www.ruby-lang.org/en/news/2022/02/18/ruby-3-1-1-released)

* [Ruby on Rails 7.0.2.3](https://rubyonrails.org/2022/3/8/Rails-7-0-2-3-6-1-4-7-6-0-4-7-and-5-2-6-3-have-been-released)

* [Bootstrap 5](https://getbootstrap.com/docs/5.0/getting-started/introduction/)

* [PostgreSQL](https://www.postgresql.org/)

* [Hosted on Heroku](https://ci-shorten.herokuapp.com/)

* Hosted in a public GitHub repo: [https://github.com/kyletcarlson/CIS](https://github.com/kyletcarlson/CIS)



# A few things I learned:

* How to [initialize](https://github.com/kyletcarlson/CIS/blob/main/app/views/layouts/application.html.erb#L32), [enable HTML](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_users_last_short_link.html.erb#L9) inside of, and [work with](https://github.com/kyletcarlson/CIS/blob/main/app/views/short_links/_short_link_popover.html.erb#L1) Bootstrap 5 popovers

* More about [before_save](https://github.com/kyletcarlson/CIS/blob/main/app/models/short_link.rb#L3) callbacks

* How to use [database indexes](https://github.com/kyletcarlson/CIS/blob/main/db/migrate/20220401025409_add_uniqueness_and_required_to_short_links.rb) to enforce uniqueness constraints, and how to use HTML5 form validation

* More about [how to use Markdown](https://www.markdownguide.org/basic-syntax). Perhaps I went a bit too far with the links, but I was on a roll and didn't want to stop!



# A few things I struggled with/want to enhance:

* I should have named the short_link property of the model "suffix" or something like that and used a method in the model and used a concatenation method to build the full URL on the fly. It's a tad confusing but still works. That would've saved data in the database, but increased the computational requirements. Both options have probably a negligible overall impact to app resources, but with a million shortlinks for example, the latter option (storing only suffix) might have been the better solution.

* I probably could DRY my tests a bit. Usually use ShouldaMatchers for basic validation tests, but since I use before_validate callbacks, it was interfering with my validation specs. I just reverted to basic, clean RSpec to get the job done.

* I tried for over an hour to implement a "copy to clipboard" function in the popover, but I couldn't get the p tag to recognize my onclick() function. It was just a bonus I wanted to push myself to try. I moved on to hosting the application.

* I implemented Ahoy! for analytics at the beginning because I thought I would use it. I ended up not, but I like having multiple sources of analytics in production applications. Google Analytics is usually one of the first things I like to wire up. #ILoveData

* The UI could definitely use some work. I enjoy front-end development and is an aspect I'd like to improve upon, but it's definitely not a strong suit. Bootstrap 5 is my go to UI toolkit, and I like developing for mobile first. Better flashes, tidied up list of shortlinks in a sortable+filterable data table, and some pixel-peeping on the positioning of some UI elements.

* I've used Kaminari in other apps for pagination. This app probably won't need it given the number of users who will be using it, but in a production app, I'd limit the number of links displayed at the bottom to maybe 10-20 per page. I'd probably use Memcached/Redis to cache the first few pages and bust the cache each time a shortlink was created just to speed the app along a bit.

* Attempt to eliminate the possibilty of foul and/or offensive words that may appear due to the pure random implementation of the URL suffix generation.

* Ability to add a flag at the end of the URL (i.e. a + like bit.ly does) to allow users to preview the full URL target before visiting a shortlink. Extending that further, a "flag" for illegal websites to allow users to report.