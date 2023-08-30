frontend = Category.create(name: 'フロントエンド')
backend = Category.create(name: 'バックエンド')
infra = Category.create(name: 'インフラ')

html = frontend.skills.create(name: 'HTML', level: 30)
css = frontend.skills.create(name: 'CSS', level: 20)
javascript = frontend.skills.create(name: 'JavaScript', level: 40)
ruby = backend.skills.create(name: 'Ruby', level: 30)
docker = infra.skills.create(name: 'Docker', level: 25)
kubernetes = infra.skills.create(name: 'Kubernetes', level: 20)
aws = infra.skills.create(name: 'AWS', level: 35)

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

# 6月に作成されたスキルのデータを追加
user.skills.create(name: 'HTML', level: 30, created_at: Time.new(2023, 6, 1))
user.skills.create(name: 'CSS', level: 20, created_at: Time.new(2023, 6, 15))
user.skills.create(name: 'JavaScript', level: 40, created_at: Time.new(2023, 6, 30))
user.skills.create(name: 'Ruby', level: 30, created_at: Time.new(2023, 6, 10))
user.skills.create(name: 'Docker', level: 25, created_at: Time.new(2023, 6, 5))
user.skills.create(name: 'Kubernetes', level: 20, created_at: Time.new(2023, 6, 20))
user.skills.create(name: 'AWS', level: 35, created_at: Time.new(2023, 6, 25))

# 7月に作成されたスキルのデータを追加
user.skills.create(name: 'HTML', level: 35, created_at: Time.new(2023, 7, 5))
user.skills.create(name: 'CSS', level: 25, created_at: Time.new(2023, 7, 20))
user.skills.create(name: 'JavaScript', level: 45, created_at: Time.new(2023, 7, 12))
user.skills.create(name: 'Ruby', level: 35, created_at: Time.new(2023, 7, 28))
user.skills.create(name: 'Docker', level: 30, created_at: Time.new(2023, 7, 8))
user.skills.create(name: 'Kubernetes', level: 25, created_at: Time.new(2023, 7, 18))
user.skills.create(name: 'AWS', level: 40, created_at: Time.new(2023, 7, 22))

# 8月に作成されたスキルのデータを追加
user.skills.create(name: 'HTML', level: 40, created_at: Time.new(2023, 8, 8))
user.skills.create(name: 'CSS', level: 30, created_at: Time.new(2023, 8, 18))
user.skills.create(name: 'JavaScript', level: 50, created_at: Time.new(2023, 8, 25))
user.skills.create(name: 'Ruby', level: 40, created_at: Time.new(2023, 8, 5))
user.skills.create(name: 'Docker', level: 35, created_at: Time.new(2023, 8, 15))
user.skills.create(name: 'Kubernetes', level: 30, created_at: Time.new(2023, 8, 28))
user.skills.create(name: 'AWS', level: 45, created_at: Time.new(2023, 8, 10))

