class PostSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :body

  # As there is a requirment to return only title and body when client requests top posts I have to use extra param
  attribute :author_id do |_, params|
    !params[:skip_author_id]
  end

end
