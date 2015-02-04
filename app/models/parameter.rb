class Parameter < ActiveRecord::Base
  include Trimmer
  trimmed_fields :key

  belongs_to :parameterable, :polymorphic => true
  validates_presence_of :key
  validates_uniqueness_of :key, :scope => [:parameterable_id, :parameterable_type]

  # attr_readonly :created_at # FIXME: these should be readonly, but inherit_resources isn't creating new instances right
  attr_accessible :created_at # FIXME: ^^
  attr_accessible :key, :value, :parameterable_id, :parameterable_type, :updated_at

  serialize :value

  fires :added_to,      :on => :create,   :secondary_subject => 'parameterable'
  fires :removed_from,  :on => :destroy,  :secondary_subject => 'parameterable'
  fires :changed_on,    :on => :update,   :secondary_subject => 'parameterable'

  def name
    "Parameter '#{key}'"
  end
end
