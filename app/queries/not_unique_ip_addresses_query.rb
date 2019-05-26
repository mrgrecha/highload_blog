class NotUniqueIpAddressesQuery

  attr_reader :raw_records

  def self.call
    self.new.call
  end

  def call
    sql = <<-SQL
      SELECT ip_addresses.value, array_agg(DISTINCT(users.login))
      FROM "posts"
      INNER JOIN "ip_addresses" ON "ip_addresses"."id" = "posts"."ip_address_id"
      INNER JOIN "users" ON "users"."id" = "posts"."author_id"
      GROUP BY ip_addresses.id
      HAVING (COUNT(DISTINCT(posts.author_id)) > 1)
    SQL
    @raw_records = ActiveRecord::Base.connection.execute(sql)
    format_output
  end

  private

  def format_output
    raw_records.to_a.each_with_object({}) do |raw_record, result_hash|
      result_hash[raw_record['value']] = raw_record['array_agg']
    end
  end
end
