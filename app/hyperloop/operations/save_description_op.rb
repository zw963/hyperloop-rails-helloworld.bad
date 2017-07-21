class SaveDescriptionOp < Hyperloop::Operation
  step do
    # operation 自己被 run 时, 一定会发生的行为.
    Helloworldmodel.create(:description => MyStore.field_value) do |result|
      alert 'unable to save' unless result == true
    end
  end
end
