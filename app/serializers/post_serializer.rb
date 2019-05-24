class PostSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :body, :author_id, :author_ip_address
end
