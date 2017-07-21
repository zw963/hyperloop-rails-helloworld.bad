class MyStore < Hyperloop::Store
  state show_field: false, reader: true, scope: :class
  state :field_value, reader: true, scope: :class

  def self.toggle_field
    mutate.show_field !show_field
    mutate.field_value ''
  end

  # 下面的 receives 相当于订阅了一个特定的操作.
  # 当操作被 run 时, 所有订阅的 callback 将立即被执行.
  receives SaveDescriptionOp do
    alert("Data saved : #{field_value}")
    mutate.field_value ''
  end
end
