module CustomButtons
  def formatted_submit_button(*args, &block)
    ActionController::Base.helpers.content_tag(:div, class: 'form-group text-center') do
      ActionController::Base.helpers.content_tag(:div, class: 'form-group col-xs-offset-4 col-xs-4') do
        submit(*args, &block)
      end
    end
  end
end
SimpleForm::FormBuilder.send(:include, CustomButtons)