# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
Faker::Config.locale = :en

languages = {'C' => 'c_cpp',
            'Java' => 'java',
            'Objective C ' => 'objectivec',
            'C#' => 'csharp',
            'php' => 'php',
            'Python' => 'python',
            'Java' => 'java',
            'JavaScript' => 'javascript',
            'Ruby' => 'ruby',
            'Perl' => 'perl',
            'Scala' => 'scala',
            'Clojure' => 'clojure',
            'SQL' => 'sql',
            'HTML' => 'html',
            'CSS' => 'css'}

#Create Language objects
languages.each do |k,v|
  Language.create(name: k, code: v)
end

#Create main user
user = User.create(first_name: 'foo', last_name: 'bar', email: 'stevenspiel@gmail.com', password: 'password', password_confirmation: 'password')

#Create snips with that user
10.times do
  (rand(6)+1).times do
    language = Language.find(rand(languages.size) + 1)
    board = user.boards.create(title: language.name)
    (rand(10)+1).times do
      user.snips.create(language_id: language.id,
                        title: Faker::Company.catch_phrase,
                        description: Faker::Lorem.sentence(sentence_count = 2),
                        content: Faker::Lorem.sentence(sentence_count = 4))
    end
  end
end

#Create New Users and create snips with those users
10.times do
  password = Faker::Internet.password
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, password_confirmation: password)
  (rand(6)+1).times do
    language = Language.find(rand(languages.size) + 1)
    board = user.boards.create(title: language.name)
    (rand(10)+1).times do
      user.snips.create(language_id: language.id,
                        title: Faker::Company.catch_phrase,
                        description: Faker::Lorem.sentence(sentence_count = 2),
                        content: Faker::Lorem.sentence(sentence_count = 4))
    end
  end
end

# Populate boards with instances
Board.all.each do |board|
  (rand(10)+1).times do
    board.instances.create(snip_id: (rand(Snip.count)+1))
  end
end