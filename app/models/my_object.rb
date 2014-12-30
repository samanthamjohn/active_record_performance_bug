class MyObject < ActiveRecord::Base
  serialize :data

  def self.create_object_with_large_unserialized_hash(num_fields)
    hash = self.build_large_hash(num_fields)
    MyObject.create(unserialized_data: hash)
  end

  def self.create_object_with_large_serialized_hash(num_fields)
    hash = self.build_large_hash(num_fields)
    MyObject.create(data: hash)
  end

  def self.build_large_hash(num_fields)
    hash = {}
    (1...num_fields).each do |num|
      hash["#{num}"] = "foo bar baz"
    end
    hash
  end
end
