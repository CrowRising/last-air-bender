require 'faraday'
class MemberService

  def self.find_all_members(nation)
    JSON.parse(conn.get("api/v1/characters?affiliation=#{nation}&perPage=200").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://last-airbender-api.fly.dev/")
  end
end