# frozen_string_literal: true

a = User.create(username: 'Vengence', password: 'password', email: 'x', avatar_url: '')

20.times do
  first_story = Story.create(user_id: a.id, title: "The Tale of #{Faker::Name.first_name}", pitch: Faker::Hipster.paragraph(sentence_count: 1), high_concept: Faker::Hipster.paragraph(sentence_count: 5))

  counter = 0
  20.times do
    counter += 1
    Chapter.create(title: "Chapter #{counter}", body: Faker::Hipster.paragraph(sentence_count: 200), chapter_index: counter, story_id: first_story.id , author_id: a.id)
  end

  5.times do
    char = Character.create(name: Faker::Name.name, story_id: first_story.id)
    char.personality = Faker::Hipster.paragraph(sentence_count: 50)
    char.appearance = Faker::Hipster.paragraph(sentence_count: 20)
    char.biography =  Faker::Hipster.paragraph(sentence_count: 20)
    char.img_url = "https://cdn1us.denofgeek.com/sites/denofgeekus/files/styles/main_wide/public/2019/05/toy_story_4_duke_caboom_keanu_reeves.jpg?itok=adUMUrqP"

    char.height = rand(100..300)
    char.weight = rand(100..300)
    char.author_id = a.id
    char.save
    CharacterInChapter.create(character_id: char.id, chapter_id: first_story.chapters.first.id)
  end

  5.times do
    Footnote.create(title: 'FN Title', body: Faker::Quotes::Shakespeare.king_richard_iii_quote, chapter_id: first_story.chapters.first.id)
  end
end
