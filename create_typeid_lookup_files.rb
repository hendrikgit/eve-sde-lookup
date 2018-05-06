#!/usr/bin/env ruby

require 'yaml'
require 'json'
require_relative 'sde.rb'

CATEGORIES = ['Ship', 'Module', 'Charge']

ids = SDE::get_type_ids_for_categories(CATEGORIES)

for cname in CATEGORIES do
  File.write("type_ids_#{cname.downcase}.json", ids[cname].to_json)
end
