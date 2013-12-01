class Quote < ActiveRecord::Base
  has_many :vote
  has_many :user, through: :vote

  def self.feed 
    select('quotes.*, count(votes.id) as votes_count').
    joins('left join votes on quotes.id = votes.quote_id').
    joins('left join reports on quotes.id = reports.quote_id').
    where('reports.id is NULL').
    group('quotes.id').
    order('votes_count DESC, quotes.updated_at DESC')
  end
end
