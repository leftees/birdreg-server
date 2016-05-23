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
      records: resource.count,
      needs_pagination: (resource.total_pages > 1)
    }
  end
  
  def meta_attributes(resource:, extra: {})
    meta = {}
    meta[:pagination] = pagination_attributes(resource: resource)
    meta.merge!(extra)
    meta
  end
  
  def generic_paginate(resource:)
    if params[:show_all]
      resource = resource.paginate(page: 1, per_page: 2**31)
    elsif params[:page]
      resource = resource.paginate(per_page: params[:page][:size], page: params[:page][:number])
    else
      resource = resource.paginate(page: 1, per_page: 30)
    end
    resource
  end
end
