module NavigationHelper

  def project_menu(projects, parent)
    unless projects.blank?
      projects.each do |project|
        parent.item "project_#{project.id}".to_sym, project.display_name, project_path(project), highlights_on: :subpath
      end
    end
  end

end
