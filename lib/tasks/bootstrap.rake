 namespace :bootstrap do
      desc "Add some quotes"
      task :add_quotes => :environment do
        Quote.create( :content => 'The only way to win is to learn faster than anyone else.', :book => 'The Lean Startup' )
        Quote.create( :content => 'When blame inevitably arises, the most senior people in the room should repeat this mantra: if a mistake happens, shame on us for making it so easy to make that mistake.', :book => 'The Lean Startup' )
        Quote.create( :content => 'From a certain point onward there is no longer any turning back. That is the point that must be reached.', :book => 'The Trial' )
        Quote.create( :content => 'When we love something, emotion often drives our actions.This is the gift and the challenge entrepreneurs face every day. The companies we dream of and build from scratch are part of us and intensely personal. They are our families. Our lives.But the entrepreneurial journey is not for everyone. Yes, the highs are high and the rewards can be thrilling. But the lows can break your heart. Entrepreneurs must love what they do to such a degree that doing it is worth sacrifice and, at times, pain. But doing anything else, we think, would be unimaginable.', :book => 'Onward: How Starbucks Fought for Its Life without Losing Its Soul' )
        Quote.create( :content => 'In times of adversity and change, we really discover who we are and what we\'re made of.', :book => 'The Trial' )
        Quote.create( :content => 'Of all creatures that breathe and move upon the earth, nothing is bred that is weaker than man.', :book => 'Odyssey' )
        Quote.create( :content => 'Control leads to compliance; autonomy leads to engagement.', :book => 'Drive: The Surprising Truth About What Motivates Us' )
        Quote.create( :content => "Money alone isn't enough to bring happiness . . . happiness [is] when you're actually truly ok with losing everything you have.", :book => "Delivering Happiness: A Path to Profits, Passion, and Purpose" )
        Quote.create( :content => "I had decided to stop chasing the money, and start chasing the passion.", :book => "Delivering Happiness: A Path to Profits, Passion, and Purpose" )
      end
  end