#!/usr/bin/env ruby

require 'yaml'
require 'json'
require_relative 'sde.rb'

CATEGORIES_ATTRIBUTES = {
  Ship: {
    attributes: ['High Slots', 'Medium Slots', 'Low Slots'],
    asInt: true
  }
}

ids = SDE::get_type_ids_for_categories(CATEGORIES_ATTRIBUTES.keys.map &:to_s)

attribute_types = YAML.load_file('dgmAttributeTypes.yaml')
attribute_ids = CATEGORIES_ATTRIBUTES.values.map { |attribute_info| attribute_info[:attributes] }.flatten.map do |attribute|
  [attribute, attribute_types.find { |at| at['displayName'] == attribute }['attributeID']]
end.to_h

type_attributes = YAML.load_file('dgmTypeAttributes.yaml')

attribute_values = {}
CATEGORIES_ATTRIBUTES.each do |category, attribute_info|
  category = category.to_s
  attributes = attribute_info[:attributes]
  attribute_values[category] = ids[category].map do |item, typeID|
    values = attributes.map do |attribute|
      type_attribute = type_attributes.find { |ta| ta['typeID'] == typeID && ta['attributeID'] == attribute_ids[attribute] }
      if type_attribute['valueInt'] && type_attribute['valueFloat']
	puts item, type_attribute
      end
      value = type_attribute['valueFloat'] || type_attribute['valueInt']
      value = value.to_i if attribute_info[:asInt]
      [attribute, value]
    end.to_h
    [item, values]
  end.to_h
end

attribute_values.each do |category, items_with_attributes|
  File.write("attributes_#{category.downcase}.json", items_with_attributes.to_json)
end
