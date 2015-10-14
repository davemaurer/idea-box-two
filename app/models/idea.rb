class Idea < ActiveRecord::Base
  def quality_level
    if 1
      "swill"
    elsif 2
      "plausible"
    else
      "genius"
    end
  end
end
