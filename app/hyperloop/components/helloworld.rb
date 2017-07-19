class Helloworld < Hyperloop::Component
  before_mount do
    # any initialization particularly of state variables goes here.
    # this will execute on server (prerendering) and client.
  end

  after_mount do
    # any client only post rendering initialization goes here.
    # i.e. start timers, HTTP requests, and low level jquery operations etc.
  end

  before_update do
    # called whenever a component will be re-rerendered
  end

  before_unmount do
    # cleanup any thing (i.e. timers) before component is destroyed
  end

  render(DIV) do
    show_button
    if MyStore.show_field
      DIV(class: 'formdiv') do
        show_input
        show_text
      end
    end
  end

  def show_button
    BUTTON(class: 'btn btn-info') do
      'Toggle button'
    end.on(:click) do |evt|
      MyStore.toggle_field
      toggle_logo(evt)
    end
  end

  def toggle_logo(evt)
    # evt.prevent_default
    logo =Element['img']
    MyStore.show_field ? logo.hide('slow') : logo.show('slow')
  end

  def show_input
    H4 do
      SPAN { 'Please type ' }
      SPAN(class: 'colored') { 'Hello World' }
      SPAN { ' in the input field below :' }
      BR {}
      SPAN { 'Or anything you want (^̮^)' }
    end
    INPUT(type: :text, class: 'form-control').on(:change) {|e| MyStore.mutate.field_value(e.target.value) }
  end

  def show_text
    H1 { MyStore.state.field_value.to_s }
  end
end
