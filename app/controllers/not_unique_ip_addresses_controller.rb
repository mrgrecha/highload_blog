class NotUniqueIpAddressesController < ApplicationController
  def index
    not_unique_ip_addresses = NotUniqueIpAddressesQuery.call
    render json: { status: 200, not_unique_ip_addresses: not_unique_ip_addresses }
  end
end
