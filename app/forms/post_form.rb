# frozen_string_literal: true

class PostForm < BaseForm
  attribute :title, String
  attribute :body, String
  attribute :author_login, String
  attribute :author_ip_address, String

  validates :author_ip_address, format: { with: Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex) }
  validates :author_login, length: { minimum: 1, maximum: 40 }
  validates :title, length: { minimum: 1, maximum: 150 }
  validates :body, length: { minimum: 1, maximum: 10_000 }

  def save
    return false unless valid?

    author_id = User.find_or_create_by(login: author_login).id
    post_ip_address = IpAddress.find_or_create_by(value: author_ip_address)
    Post.create(title: title, body: body, author_id: author_id, ip_address: post_ip_address)
  end
end
