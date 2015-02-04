module HasParameters
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def has_parameters(options={})
      attr_accessible :parameters_attributes

      has_many :parameters, {:as => :parameterable, :dependent => :destroy}.merge(options) do
        def to_hash
          Hash[*all.map{|p| [p.key, p.value]}.flatten]
        end
      end

      accepts_nested_attributes_for :parameters, :allow_destroy => true, :reject_if => :all_blank

      include HasParameters::InstanceMethods
    end
  end

  module InstanceMethods
  end
end

ActiveRecord::Base.send(:include, HasParameters)
