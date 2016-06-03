class CategoryTree
  extend Forwardable
  def add_category(category, parent)
    fail ArgumentError, "#{parent} is already taken!" if table.values.flatten.include?(category)
    table[parent] ||= []
    table[parent] << category
  end

  def get_children(category)
    table[category]
  end

  private

  def table
    @table ||= {nil => []}
  end
end
