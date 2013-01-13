namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [User, Directory, Entry, Likes].each(&:delete_all)

    for i in  1..5 do
      dt = Directory.new 
      dt.name = Populator.words(2).capitalize
      dt.description = Faker::Lorem.sentence(20)
      dt.save
      for i in 1..5 do
        e.title = test
        d.name = Populator.words(1..3).capitalize
        d.grams = 50 .. 500
        d.price = 5 .. 50
        d.time = 5 .. 30
      end
    end

    i = 0
    Table.populate 5 do |t|
      i = i + 1
      t.number = i
      t.qr_code = '111%s' % i 
    end

  end
end
