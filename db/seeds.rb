a = User.create(username: 'Vengence' , password: "password" , email: 'x' , avatar_url: '')

first_story = Story.create(user_id: a.id , title: 'The Tale of Vengence' , pitch:'I am a pitch!' , high_concept: 'Wilko')

counter = 0
20.times do
  counter = counter + 1
  Chapter.create(title: "Chapter #{counter}" , body: "" , chapter_index: counter , story_id: first_story.id)
end

5.times do
  Character.create(name: 'Alpha' , personality: "" , story_id: first_story.id , appearance: "")
end

5.times do
  Footnote.create(title: 'FN Title' , body: "FN Body" , chapter_id: 1)
end