module FormBuilders
    class Custom < ActionView::Helpers::FormBuilder
      include ActionView::Helpers::TagHelper

      attr_accessor :output_buffer

      def text_field(attribute, options = {})
        options.merge!(class: 'form-control')
        content_tag :div, class: 'mb-4' do
          label(attribute, { class: 'form-label' }) + super + error_message(attribute)
        end
      end

      def text_area(attribute, options = {})
        options.merge!(class: 'form-control')
        content_tag :div, class: 'mb-4' do
          label(attribute, { class: 'form-label' }) + super + error_message(attribute)
        end
      end

      def text_area_custom(attribute, options = {})
        content_tag :div, class: 'my-5 mx-5' do
          text_area(attribute)
        end
      end

      def submit(value = nil, options = {})
        options.merge!(class: 'btn btn-outline-primary')

        content_tag :div, class: 'my-4 d-grid gap-2' do
          super
        end
      end

      private

      def error_message(attribute)
        return '' if object.errors[attribute].empty?

        content_tag :div, class: 'mx-3 text-danger' do
          object.errors[attribute].join(', ')
        end
      end
    end
  end