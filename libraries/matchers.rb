if defined?(ChefSpec)
  def create_web_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:web_site, :create, resource_name)
  end
  def delete_web_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:web_site, :delete, resource_name)
  end
end
