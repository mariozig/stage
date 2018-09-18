module Admin
  class GalleriesController < Admin::ApplicationController
    def create
      resource = resource_class.new(resource_params)
      resource.submission = Submission.find(params[:gallery][:submission_id]) if params[:gallery][:submission_id].present?
      resource.category = Category.default_category

      authorize_resource(resource)

      if resource.save
        update_file_associations(resource)
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource('create.success')
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }
      end
    end

    private

    def update_file_associations(gallery)
      gallery.submission.files.each do |file|
        gallery.files << file
      end
    end
  end
end
