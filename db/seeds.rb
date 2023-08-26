frontend = Category.create(name: 'フロントエンド')
backend = Category.create(name: 'バックエンド')
infra = Category.create(name: 'インフラ')

html = frontend.skills.create(name: 'HTML', level: 30)
css = frontend.skills.create(name: 'CSS', level: 20)
javascript = frontend.skills.create(name: 'JavaScript', level: 40)
ruby = backend.skills.create(name: 'Ruby', level: 30)


user = User.create!(
  name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar"
)

user.skills << html
user.skills << css
user.skills << javascript
user.skills << ruby





