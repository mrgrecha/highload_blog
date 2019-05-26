# frozen_string_literal: true

class NotUniqueIpAddressesSerializer
  attr_reader :not_unique_ip_addresses

  def initialize(not_unique_ip_addresses)
    @not_unique_ip_addresses = not_unique_ip_addresses
  end

  def as_json
    not_unique_ip_addresses.each_with_object({}) do |record, result_hash|
      result_hash[record.ip_address] = record.array_of_authors
    end
  end
end
