class Task < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :project_id, :name
  validates :done, :inclusion => { :in => [true, false] }
end
