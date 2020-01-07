# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include AttendingsHelper
end
