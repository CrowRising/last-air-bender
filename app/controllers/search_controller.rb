class SearchController < ApplicationController
  def index
    @nation = params[:nation].gsub!("+", " ")
    @members = MemberFacade.get_members(params[:nation])
  end

end