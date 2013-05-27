module NavigationHelper

  def project_menu(projects, parent)
    unless projects.blank?
      projects.each do |project|
        id = "project_#{project.id}".to_sym
        parent.item id, project.display_name, project_path(project), highlights_on: :subpath do |product_submenu|
          category_menu(project.categories, product_submenu)
        end
      end
    end
  end

  def category_menu(categories, parent_menu)
    unless categories.blank?
      categories.each do |category|
        id = "project_#{category.project.id}_category_#{category.id}".to_sym
        parent_menu.item id, category.display_name, project_category_path(category.project, category), highlights_on: :subpath do |category_submenu|
          feature_menu(category.features, category_submenu)
        end
      end
    end
  end

  def feature_menu(features, parent_menu)
    unless features.blank?
      features.each do |feature|
        id = "project_#{feature.category.project.id}_category_#{feature.category.id}_feature_#{feature.id}".to_sym
        url = project_category_feature_path(feature.category.project, feature.category, feature)
        parent_menu.item id, feature.display_name, url, highlights_on: :subpath do |feature_submenu|
          # scenario_menu(feature.scenarios, feature_submenu)
        end
      end
    end
  end

end
