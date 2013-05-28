def set_feature_from_name(name, feature = nil)
  feature ||= FactoryGirl.create(:feature, name: name)
  instance_variable_set("@feature_#{name.downcase}", feature)
end

def get_feature_from_name(name)
  instance_variable_get("@feature_#{name.downcase}")
end
