class Organization < ActiveRecord::Base
  has_many :organization_positions
  has_many :positions, through: :organization_positions
  has_one :location
  enum type: { :LLC => 0, :Corporation => 1, :"Foreign Entity" => 2, :Partnership => 3 }
 # enum type: [ :LLC, :Corporation, :Foreign, :Partnership ]
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
  belongs_to :organization
end
