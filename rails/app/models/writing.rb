class Writing
  def self.all
    [TheBit.new, *BlogPost.all]
  end
end
