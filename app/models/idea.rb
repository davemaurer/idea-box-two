class Idea < ActiveRecord::Base
  enum quality: {swill: 1, plausible: 2, genius: 3}
end
