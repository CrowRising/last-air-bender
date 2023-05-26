class MemberFacade

  def self.get_members(nation)
    MemberService.find_all_members(nation).map do |data|
      Member.new(data)
    end
  end
end