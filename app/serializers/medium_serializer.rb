class MediumSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :creator, :genre, :year, :image, :review, :rating, :status, :cast, :plot
end
