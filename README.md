# Agora Blog App
Agora blog is a basic blog application implemented in Ruby on Rails as a backend and Bootstrap for the frontend. Time to complete the project: 5 days.

The application is deployed on heroku and can be accessed by clicking the following link:
[Agora blog](https://ludo-first-blog.herokuapp.com/)

### Intro

This is how my landing page looks like

**Fig. 1 home page**
![alt memory](/screen_shot_hp.png)

If you are a **visitor** of the blog than the only actions allowed are:

1. **Listing all articles**: This action is available on the top navigation bar by clicking on the link *articles*.

2. **Listing all users**: This action is available on the navigation menu by clicking on the link *users*.

3. **Filtering the articles by category**: this action is available by clicking on the *category drop-down menu* next to the search box.

If you want to create an account or sign in, go to the *sign up* or *sign in* tab. Once logged in, the server redirects to the user's profile page.

**Fig. 2 user's profile page**
![alt memory](/profile_page.png)

The profile's page display all the articles created by the user and allows to **edit** and **delete** them.

The **user** can  **create** a new article by clicking on the actions dropdown menu on the navigation bar.

**Fig. 3 Create article**
![alt memory](/create_form_view.png)

The form in **Fig. 3** allows the user to write a title and content of the article. It also allows to associate categories to the article that are created in the system.

Lastly, the system implements the administrator functionality. The administrator can **edit** and **delete** user's account. Moreover, the administrator is allowed to edit and create new categories in the blog.

### System design

#### Data Base design

**Fig. 4 ERD MODEL**
![alt memory](/erd_model.png)

**Fig. 4** illustrates the ERD (Entity Relation Diagram) of the model. The model includes three tables. The associations are:

- One user has many (or no) articles.
- An article belongs to a single user.
- An article has many (or no) categories.
- A category has many (or no) articles.

#### Rails MVC

**Fig. 5**
![alt memory](/rails_mvc.png)


...

### Technologies and features
Ruby version <code>ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]</code>.
The libraries used in this project are located in the *Gemfile*. To install the libraries, run the command <code>$ bundle</code> in the shell.

- To use bootstrap for styling in the views:
```
gem "jquery-rails", "~> 4.3"
gem 'bootstrap-sass', '~> 3.3.7'
```

- To encrypt the user's password:
```
gem 'bcrypt', '~> 3.1.7'
```
- To install the  **pagination** feature:
```
gem 'will_paginate', git: 'https://github.com/mislav/will_paginate'
```
To use the pagination in the views, include the following code in the controller. e.g : *articles_controller.rb*
```
def index
# or, use an explicit "per page" limit:
  @articles = Article.paginate(page: params[:page], per_page: 5)
end
```
And the following snippet code in the *views/article/index.html.erb*
```
<div align="center">
  <%= will_paginate @articles %>
</div>
```
- To display the user's profile image, use the server called [gravatar](https://en.gravatar.com/). You can associate an image with your email address. To grab the user's profile image from this website include the following code in your user's view. e.g *views/users/show.html.erb*
```
<%= gravatar_for @user, size: 150 %>
```
The *gravatar_for* method is defined in the *helpers/application_helper.rb*

### Acknowledgement

I'm extremely grateful to the GA's instructors: *Joel* and *Rashida* for their valuable help. I would also express my gratitude to all my classmates (*SEI33*) for the great time spent together.

### Future Feature

- Add *followers* and *followed* to each user.
- Add *likes* and *comments* to articles.
- Add *forum* and *chat* to private channels.
