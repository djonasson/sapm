def set_category_from_name(name, category = nil)
  category ||= FactoryGirl.create(:category, name: name)
  instance_variable_set("@category_#{name.downcase}", category)
end

def get_category_from_name(name)
  instance_variable_get("@category_#{name.downcase}")
end
