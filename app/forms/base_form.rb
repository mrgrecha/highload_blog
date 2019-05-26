class BaseForm
  include Virtus.model
  include ActiveModel::Validations

  def save
    raise NotImplementedError
  end
end
