
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

  state :show_field, false

  render(DIV) do
    show_button
    DIV(class: 'formdiv') do
      show_input
      show_text
    end if state.show_field
  end

  def show_button
    BUTTON(class: 'btn btn-info') do
      'Toggle button'
    end.on(:click) { mutate.show_field(!state.show_field) }
  end

  def show_input
    H4 do
      SPAN { 'Please type ' }
      SPAN(class: 'colored') { 'Hello World' }
      SPAN { ' in the input field below :' }
      BR {}
      SPAN { 'Or anything you want (^̮^)' }
    end

    INPUT(type: :text, class: 'form-control')
  end

  def show_text
    H1 { 'input field value will be displayed here' }
  end
  end
