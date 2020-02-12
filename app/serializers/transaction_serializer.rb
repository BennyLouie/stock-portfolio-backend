class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock, :price, :quantity
end
