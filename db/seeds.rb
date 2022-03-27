10.times do |index|
Article.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs.join("\n"),
    author: Faker::Name.unique.name,
)
end