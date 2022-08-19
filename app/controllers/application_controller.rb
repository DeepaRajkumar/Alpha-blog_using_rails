class ApplicationController < ActionController::Base
  def new_record?
    (answer = super).nil? ? true : answer
  end
end
