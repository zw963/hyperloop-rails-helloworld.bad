class DescriptionRow < Hyperloop::Component
  param :descriptionparams

  def render
    TR(class: 'table-success') do
      TD(width: '50%') { params.descriptionparams }
    end
  end
end
