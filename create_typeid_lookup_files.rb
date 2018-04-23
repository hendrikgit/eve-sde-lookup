#!/usr/bin/env ruby

require 'yaml'
require 'json'

CATEGORIES = ['Ship', 'Module', 'Charge']

category_ids = YAML.load_file('categoryIDs.yaml')
categories = {}
for category in CATEGORIES do
  categories[category] = category_ids.find { |k, v| v['name']['en'] == category }.first
end

group_ids = YAML.load_file('groupIDs.yaml')
categories_group_ids = {}
categories.keys.each { |cname| categories_group_ids[cname] = [] }
for gid, data in group_ids do
  next unless data['published']
  for cname, cid in categories do
    categories_group_ids[cname] << gid if categories[cname] == data['categoryID']
  end
end

type_ids = YAML.load_file('typeIDs.yaml')
ids = {}
categories.keys.each { |cname| ids[cname] = {} }
for tid, data in type_ids do
  next unless data['published']
  for cname, gids in categories_group_ids
    ids[cname][data['name']['en']] = tid if categories_group_ids[cname].include? data['groupID']
  end
end

for cname in categories.keys do
  File.write("type_ids_#{cname.downcase}.json", ids[cname].to_json)
end
