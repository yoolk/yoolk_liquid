def setup_view_and_controller
  @view                 = ActionView::Base.new
  @controller           = ApplicationController.new
  @request              = ActionController::TestRequest.new
  @response             = ActionController::TestResponse.new
  @response.request     = @request
  @controller.request   = @request
  @controller.response  = @response
  @controller.params    = {}
  @view.assign_controller(@controller)
  @view.class.send(:include, @controller._helpers)
end

def view
  @view
end

def controller
  @controller
end

def expect_template_result(template, expected, assigns={})
  actual = Liquid::Template.parse(template).render!(assigns, { registers: { helper: @view, view: @view, controller: @controller } })
  expect(actual).to eq(expected)
end