# frozen_string_literal: true

class BaseForm
  include Virtus.model
  include ActiveModel::Validations

  def save
    raise NotImplementedError
  end
end
