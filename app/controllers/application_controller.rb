class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def pagination_attributes(resource:)
    {
      page: resource.current_page,
      next: resource.next_page,
      prev: resource.previous_page,
      pages: resource.total_pages,
      records: resource.count
    }
  end
  
  def meta_attributes(resource:, extra: {})
    meta = {}
    meta.merge!({ pagination: pagination_attributes(resource: resource) })
    meta.merge!(extra)
    meta
  end
end
