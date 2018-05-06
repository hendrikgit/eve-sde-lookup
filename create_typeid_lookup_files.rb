#!/usr/bin/env ruby

require 'yaml'
require 'json'
require_relative 'sde.rb'

CATEGORIES = ['Ship', 'Module', 'Charge']

ids = SDE::get_type_ids_for_categories(CATEGORIES)

CATEGORIES.each do |category|
  File.write("type_ids_#{category.downcase}.json", ids[category].to_json)
end
