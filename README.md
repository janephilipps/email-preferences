# Email Preferences App

By [Jane Philipps](mailto:jane.philipps@gmail.com)

[janephilipps.github.io](http://janephilipps.github.io)

## Instructions

1. Clone locally using `git clone git@github.com:janephilipps/email-preferences.git`
2. `cd` into `email-preferences` directory
3. Install dependencies using `bundle install`
4. Make sure you have a local instance of PostgreSQL running
5. Setup and seed database using `rake db:setup`
6. Start server using `rails s`
7. Navigate to app in [browser](http://localhost:3000/users).

You will see a table of users with associated tokens for each user. You can use the button and links provided next to the user listing to create tokens associated with the user, edit the user (without URL params, to make it easier to test without security), show the user record, or delete the user record. You can use the link next to the token to edit the user (with URL params, to make it easier to test with security).

## Discussion

The technologies I used to build this app are: Ruby on Rails (v4.2.6) and PostgreSQL (v9.6.1).

## Requirements

#### Users

If you try to create a new user or edit an existing user with an email address that already exists, a warning will pop up saying "A user with that email address already exists!".

#### Tokens

I used [SecureRandom](https://ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html) to generate the nonce for each token, so each nonce will be unique.


#### Email settings view

If you navigate to the email settings view without any query params, or without the correct email address or token params, a flash message will pop up saying "Access denied!" and no changes will be accepted.

For the UI, if you check "Do not email", if any of the other boxes are checked, they will be unchecked. Conversely, if "Do not email" is checked and you check "Marketing", "Articles", or "Digest", "Do not email" will be unchecked.
