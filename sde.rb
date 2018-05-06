module SDE
  def self.get_type_ids_for_categories(categories_to_get)
    @category_ids ||= YAML.load_file('categoryIDs.yaml')
    categories = {}
    categories_to_get.each do |category|
      categories[category] = @category_ids.find { |k, v| v['name']['en'] == category }.first
    end

    @group_ids = YAML.load_file('groupIDs.yaml')
    categories_group_ids = {}
    categories.keys.each { |category| categories_group_ids[category] = [] }
    @group_ids.each do |gid, data|
      next unless data['published']
      categories.each do |category, cid|
        categories_group_ids[category] << gid if categories[category] == data['categoryID']
      end
    end

    @type_ids = YAML.load_file('typeIDs.yaml')
    ids = {}
    categories.keys.each { |category| ids[category] = {} }
    @type_ids.each do |tid, data|
      next unless data['published']
      categories_group_ids.each do |category, gids|
        ids[category][data['name']['en']] = tid if categories_group_ids[category].include? data['groupID']
      end
    end

    return ids
  end
end
