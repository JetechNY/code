class User < ActiveRecord::Base

    has_many :reviews
    has_many :movies, through: :reviews

end

# def buy_affordable_item(item)
#     if !self.item_id
#         self.update(item_id: item.id)
#     elsif !self.item_2_id
#         self.update(item_2_id: item.id)
#     elsif !self.item_3_id
#         self.update(item_3_id: item.id)
#     else
#         bag_full_special_update
#     end
#      self.update(currency: self.currency - item.currency)
#      self.update(atk: self.atk + item.atk)
#      self.update(blk: self.blk + item.blk)
#      self.update(hp: self.hp + item.hp)
#      self.update(luck: self.luck + item.luck)
# end