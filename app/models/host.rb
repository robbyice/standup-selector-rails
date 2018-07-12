class Host < ApplicationRecord

  def as_json(*)
    super.except('created_at', 'updated_at')
  end
end
