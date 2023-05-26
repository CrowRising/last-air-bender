class Member
  attr_reader :name,
              :allies,
              :enemies,
              :affiliation,
              :photo

  def initialize(attributes)
      @name = attributes[:name]          
      @allies = if attributes[:allies] == []
                  "None"
                else
                  attributes[:allies]
                 end
      @enemies = if attributes[:enemies] == []
                   "None"
                else 
                  attributes[:enemies]
                end
      @affiliation = attributes[:affiliation]          
      @photo = attributes[:photoUrl]   
  end

end