# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create! (
    [
      { name: "Vanya" },
      { name: "Vasya" },
      { name: "Petya" }
    ]
  )

Category.create! (
    [
      { title: "Ruby on Rails" },
      { title: "HTML" },
      { title: "PHP" },
    ]
  )

Test.create! (
    [
      { title: "RoR basics", level: 1, category_id: 1 },
      { title: "HTML basics", level: 0, category_id: 2 },
      { title: "PHP basics",  level: 1, category_id: 3 }
    ]
  )

Question.create! (
    [
      { body: "Как отменить последнюю миграцию?", test_id: 1 },
      { body: "Как заново создайть базу данных?", test_id: 1 },
      { body: "С помощью какого тега создаются поля формы?", test_id: 2 }
    ]
  )

Answer.create! (
    [
      { body: "rails db:rollback", correct: true, test_id: 1, user_id: 1 },
      { body: "rails db:recreate", correct: false, test_id: 2, user_id: 2 },
      { body: "form", correct: true, test_id: 2, user_id: 1 }
    ]
  )








