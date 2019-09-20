# frozen_string_literal: true

lilJim = User.create(username: 'LilJimmy', password: 'password', email: 'email-address-goes-here')
genesis = Story.create(title: 'The Tale of Darth Plageius the Wise', user_id: lilJim.id)
UserStory.create(story_id: genesis.id, user_id: lilJim.id)

xd = Story.create(title: 'Fragadard', user_id: lilJim.id)
counter = 0
10.times do
  counter += 1
  Chapter.create(story_id: xd.id, title: "Chapter #{counter}", body: Faker::Lorem.sentence(word_count: rand(500...600)))
end

UserStory.create(story_id: xd.id, user_id: lilJim.id)
counter = 0
10.times do
  counter += 1
  Chapter.create(story_id: genesis.id, title: "Chapter #{counter}", body: Faker::Lorem.sentence(word_count: rand(500...600)))
end

# =======================================================

fb = User.create(username: 'FrillBosby', password: 'password', email: 'email-address-goes-here')
exodus = Story.create(title: 'A Dangerous Book for Gender-Nonconforming People', user_id: fb.id)
UserStory.create(story_id: exodus.id, user_id: fb.id)

counter = 0
10.times do
  counter += 1
  Chapter.create(story_id: exodus.id, title: "Chapter #{counter}", body: Faker::Lorem.sentence(word_count: rand(500...600)))
end

#=====================================================

10.times do
    Character.create(name: Faker::Name.name , story_id: 1)
end
