user_list = [
    ['Mark Zuckerberg', 'mark@facebook.com', 0, 0, 1, 0, '69680e240edafd691851'],
    ['Even Spiegel', 'evan@snapchat.com', 0, 1, 1, 0, '3a874db7707e342bce96'],
    ['Jeff Bezos', 'jeff@amazon.com', 0, 0, 0, 1, '964387cd83cb39c73173'],
    ['Tim Cook', 'tim@apple.com', 1, 0, 0, 0, '2e8727af013ba60530b4'],
    ['Larry Page', 'larry@google.com', 0, 0, 1, 0, 'a045b07cc245ec71fbc7'],
    ['Travis Kalanick', 'travis@uber.com', 1, 0, 1, 0, '970c3ef8cd165aabd4de'],
    ['Brian Chesky', 'brian@airbnb.com', 1, 1, 1, 0, 'ceec9afed4c32242159c']
]

user_list.each do |name, email, marketing, articles, digest, do_not_email, nonce|
  u = User.create(
    name: name,
    email: email,
    marketing: marketing,
    articles: articles,
    digest: digest,
    do_not_email: do_not_email
  )
  Token.create(nonce: nonce, user_id: u.id)
end
