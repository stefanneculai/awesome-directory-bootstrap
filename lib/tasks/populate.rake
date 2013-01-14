namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [User, Directory, Entry, Like, Content].each(&:delete_all)

    users = Array.new
    users.push(User.create(:email => "test@test.com", :password => "asdasdasd"))
    users.push(User.create(:email => "test2@aaa.com", :password => "asdasdasd"))

    for i in  1..5 do
      dt = Directory.new 
      dt.name = Populator.words(2).capitalize
      dt.description = Faker::Lorem.sentence(20)
      dt.save
      dContent = Content.create(:contentable => dt, :user => users[i%2])
      for j in 1..5 do
        e = Entry.new
        e.title = Populator.words(1..3).capitalize
        e.body = Faker::Lorem.sentence(20)
        e.rating = Random.new.rand(1..5)
        e.save
        eContent = Content.create(:contentable => e, :user => users[i%2])
        Mapping.create(:parent => dContent, :child => eContent)
      end
    end
    
  end
end
