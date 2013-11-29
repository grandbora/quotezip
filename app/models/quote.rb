class Quote < ActiveRecord::Base
  has_many :vote
  has_many :user, through: :vote

  scope :feed,
    select('quotes.*, count(votes.id) as votes_count').
    joins('left join votes on quotes.id = votes.quote_id').
    group('quotes.id').
    order('votes_count DESC, quotes.updated_at DESC')

end
