frontend = Category.create(name: 'フロントエンド')
backend = Category.create(name: 'バックエンド')
infra = Category.create(name: 'インフラ')

html = frontend.skills.create(name: 'HTML', level: 30,created_at: Time.new(2023, 6, 1))
css = frontend.skills.create(name: 'CSS', level: 20,created_at: Time.new(2023, 7, 1))
javascript = frontend.skills.create(name: 'JavaScript', level: 40,created_at: Time.new(2023,8,1))
ruby = backend.skills.create(name: 'Ruby', level: 30,created_at: Time.new(2023, 6, 1))
Php = backend.skills.create(name: 'PHP', level: 30,created_at: Time.new(2023, 7, 1))
pyson = backend.skills.create(name: 'Pyson', level: 30,created_at: Time.new(2023, 8, 1))
docker = infra.skills.create(name: 'Docker', level: 25,created_at: Time.new(2023, 6, 1))
kubernetes = infra.skills.create(name: 'Kubernetes', level: 20,created_at: Time.new(2023, 7, 1))
aws = infra.skills.create(name: 'AWS', level: 35,created_at: Time.new(2023, 8, 1))

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
user.skills << docker
user.skills << kubernetes
user.skills << aws
user.skills << Php
user.skills << pyson

# 6月に作成されたスキルのデータを追加
