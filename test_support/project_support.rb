def set_project_from_name(name, project = nil)
  project ||= FactoryGirl.create(:project, name: name)
  instance_variable_set("@project_#{name.downcase}", project)
end

def get_project_from_name(name)
  instance_variable_get("@project_#{name.downcase}")
end
