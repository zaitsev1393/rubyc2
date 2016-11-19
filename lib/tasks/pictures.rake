namespace :pictures do
  desc "TODO"
  task upload: :environment do


    $path = "/Users/zaitsev/proj/rubyc/app/assets/images/"

    obj = Hash.new
    Dir[$path + '*'].each do |d|
      key = d.split('/').last

      unless Category.find_by(title: key)
        category = Category.new(title: key)
        category.save

        obj[key] = Dir[$path + key + '**/*']
        obj[key].each do |f|
          picture = Picture.new
          name = f.split('/').last
          picture.url = key.to_s + '/' + name
          picture.category_id = category.id
          picture.save
          print "Picture #{name} uploaded!\n"
        end
        print "Category #{key} created!\n"
        end

      end
    end


end
