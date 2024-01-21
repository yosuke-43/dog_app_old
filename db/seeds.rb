15.times do |index|
  Board.create!(
    user: User.offset(rand(9..17)).first,
    dog: Dog.offset(rand(Dog.count)).first,
    title: "タイトル#{index}",
    body: "本文#{index}"
  )
end