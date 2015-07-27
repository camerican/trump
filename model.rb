class Organization < ActiveRecord::Base
  has_many :organization_positions
  has_many :positions, through: :organization_positions
  belongs_to :location
  enum category: { :LLC => 0, :Corporation => 1, :"Foreign Entity" => 2, :Partnership => 3, :"Non Profit" => 4 }

end

class Position < ActiveRecord::Base
  has_many :organization_positions
  has_many :organizations, through: :organization_positions
end

class OrganizationPosition < ActiveRecord::Base
  belongs_to :organization
  belongs_to :position
end

class Location < ActiveRecord::Base
  has_one :organization
end
