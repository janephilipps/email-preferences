# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
    [1, 'Mark Zuckerberg', 'mark@facebook.com', 0, 0, 1, 0],
    [2, 'Even Spiegel', 'evan@snapchat.com', 0, 1, 1, 0],
    [3, 'Jeff Bezos', 'jeff@amazon.com', 0, 0, 0, 1],
    [4, 'Tim Cook', 'tim@apple.com', 1, 0, 0, 0],
    [5, 'Larry Page', 'larry@google.com', 0, 0, 1, 0],
    [6, 'Travis Kalanick', 'travis@uber.com', 1, 0, 1, 0],
    [7, 'Brian Chesky', 'brian@airbnb.com', 1, 1, 1, 0]
]

token_list = [
    [1, '69680e240edafd691851', 1],
    [2, '3a874db7707e342bce96', 2],
    [3, '964387cd83cb39c73173', 3],
    [4, '2e8727af013ba60530b4', 4],
    [5, 'a045b07cc245ec71fbc7', 5],
    [6, '970c3ef8cd165aabd4de', 6],
    [7, 'ceec9afed4c32242159c', 7]
]

user_list.each do |id, name, email, marketing, articles, digest, do_not_email|
  User.create(
    id: id,
    name: name,
    email: email,
    marketing: marketing,
    articles: articles,
    digest: digest,
    do_not_email: do_not_email
  )
end

token_list.each do |id, nonce, user_id|
  Token.create(
    id: id,
    nonce: nonce,
    user_id: user_id
  )
end