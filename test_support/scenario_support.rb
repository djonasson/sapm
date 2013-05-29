def set_scenario_from_name(name, scenario = nil)
  scenario ||= FactoryGirl.create(:scenario, name: name)
  instance_variable_set("@scenario_#{name.downcase.gsub(' ', '_')}", scenario)
end

def get_scenario_from_name(name)
  instance_variable_get("@scenario_#{name.downcase.gsub(' ', '_')}")
end
