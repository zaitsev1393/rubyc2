class Sleeper

  def self.queue
    :sleep
  end

  def self.perform seconds
    sleep seconds
    puts 'Comment sleep'
  end

end