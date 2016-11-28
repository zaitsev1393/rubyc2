namespace :faker do
  desc "TODO"
  task users: :environment do
  
    5.times do
      user = User.new
      user.email = Faker::Internet.email
      user.password = '123456'
      user.save
    end
    
  end

end
