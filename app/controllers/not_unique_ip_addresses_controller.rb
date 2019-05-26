class NotUniqueIpAddressesController < ApplicationController
  def index
    not_unique_ip_addresses_json = NotUniqueIpAddressesSerializer.new(NotUniqueIpAddress.all).as_json
    render json: { status: 200,
                  not_unique_ip_addresses: not_unique_ip_addresses_json }, status: :ok
  end
end
