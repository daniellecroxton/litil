module TagsHelper
  def product_tag_links(product)
    links = product.tags.map{ |tag| link_to(tag.name, tag_path(tag)).html_safe }
    safe_join(links, ', ')
  end
end
