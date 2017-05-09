# MbMb - Moto bike Maintenance buddy
> First personal project after finishing my Codaisseur education

## About
This project I have set up to create a motorbike maintenance Web Application to be used for my motorbike.
My purpose is to make this a long-term project, where other people can add their motorbikes, add & change maintenance schedules & see whether their motorbikes are in need of maintenance.

In the longer term I would also want to add the possibility for motorbike garages to subscribe, create their company profile/page with prices of maintenance etc.

Linking motorbike owners & garage owners together will be another step. Where the motorbike owners can check what they want to have maintenced and how much that would cost at different garages.

As an example I'm looking at this App: [Car Maintenance Reminder Light](https://play.google.com/store/apps/details?id=com.cooloy.OilChangeSchedule)

## ScreenShots
To be shot...

## Running Locally
> This won't do much for you at the moment... just warning you...
Make sure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.
You should also have a [Postgresql](https://www.postgresql.org/) database running.

  1. `git clone git@github.com:Winkeltje84/MbMb.git`
  2. `cd MbMb`
  3. `bundle install`
  4. `rails db:create db:migrate db:seed`
  5. `rails server`
  6. Go to your [localhost](http://localhost:3000) on port 3000(default)

## Related Documentation
  * [Ruby on Rails](http://rubyonrails.org/)
  * [Comparable app: Car Maintenance Reminder Light](https://play.google.com/store/apps/details?id=com.cooloy.OilChangeSchedule)
