module TagsHelper
  def product_tag_links(product)
    links = product.tags.each do |tag|
      link_to tag.name, tag_path(tag)
    end
    links.to_sentence
  end
end
