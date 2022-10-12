class Article < ApplicationRecord
  include ActionText::Attachable

  has_rich_text :body

  def attachable_plain_text_representation(caption = nil)
    caption || title
  end
end
