User.destroy_all
puts "Creating users"
u1 = User.create :username => 'ludo1', :email => 'ludo1@ga.co', :password => 'chicken'
u2 = User.create :username => 'ludo2', :email => 'ludo2@ga.co', :password => 'chicken'
u3 = User.create :username => 'ludo3', :email => 'ludo3@ga.co', :password => 'chicken'
u4 = User.create :username => 'ludo4', :email => 'ludo4@ga.co', :password => 'chicken'


article_text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

Article.destroy_all
a1 = Article.create :title => "ludo1 01", :description => "#{article_text}", :user_id => u1.id
a2 = Article.create :title => "ludo1 02", :description => "#{article_text}", :user_id => u1.id
a3 = Article.create :title => "ludo1 03", :description => "#{article_text}", :user_id => u1.id
a4 = Article.create :title => "ludo1 04", :description => "#{article_text}", :user_id => u1.id

a5 = Article.create :title => "ludo2 01", :description => "#{article_text}", :user_id => u2.id
a6 = Article.create :title => "ludo2 02", :description => "#{article_text}", :user_id => u2.id
puts "Created #{ Article.count } articles"
