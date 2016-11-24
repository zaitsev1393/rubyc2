namespace :pictures do
  desc "TODO"
  task upload: :environment do


    $path = "/home/zaycev_g/boobs/"

    obj = Hash.new
    Dir[$path + '*'].each do |d|
      key = d.split('/').last

      unless Category.find_by(title: key)
        category = Category.new(title: key)
        category.save

        obj[key] = Dir[$path + key + '/*']
        obj[key].each do |f|
          picture = Picture.new
          File.open(f) do |file|
            picture.image = file
          end
          picture.category_id = category.id
          picture.save
          print "Picture #{picture.image.url} uploaded!\n"
        end
        print "Category #{key} created!\n"
        end

      end
    end


    # obj = Hash.new
    # Dir[$path + '*'].each do |d|
    #   key = d.split('/').last

    #   unless Category.find_by(title: key)
    #     category = Category.new(title: key)
    #     category.save

    #     obj[key] = Dir[$path + key + '**/*']
    #     obj[key].each do |f|
    #       picture = Picture.new
    #       name = f.split('/').last
    #       picture.url = key.to_s + '/' + name
    #       picture.category_id = category.id
    #       picture.save
    #       print "Picture #{name} uploaded!\n"
    #     end
    #     print "Category #{key} created!\n"
    #     end

    #   end
    # end


end
