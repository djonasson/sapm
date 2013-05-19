require "simple-navigation"
require "simple_navigation/rendering/renderer/bootstrap"
require "simple_navigation/rendering/renderer/bootstrap_breadcrumbs"
SimpleNavigation.register_renderer bootstrap: SimpleNavigation::Renderer::Bootstrap
SimpleNavigation.register_renderer bootstrap_breadcrumbs: SimpleNavigation::Renderer::BootstrapBreadcrumbs
