# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create! (
    [
      { name: "Vanya" },
      { name: "Vasya" },
      { name: "Petya" }
    ]
  )

category = Category.create! (
    [
      { title: "Ruby on Rails" },
      { title: "HTML" },
      { title: "PHP" },
    ]
  )

test = Test.create! (
    [
      { title: "RoR basics",  level: 1, category_id: category[0].id, author_id: user[2].id },
      { title: "HTML basics", level: 0, category_id: category[1].id, author_id: user[2].id },
      { title: "PHP basics",  level: 1, category_id: category[2].id, author_id: user[2].id }
    ]
  )

question = Question.create! (
    [
      { body: "Как отменить последнюю миграцию?", test_id: test[0].id },
      { body: "Как заново создать базу данных?", test_id: test[0].id },
      { body: "С помощью какого тега создаются поля формы?", test_id: test[1].id }
    ]
  )

Answer.create! (
    [
      { body: "rails db:rollback", correct: true, question_id: question[0].id },
      { body: "rails db:recreate", correct: false, question_id: question[1].id },
      { body: "form", correct: true, question_id: question[2].id }
    ]
  )

TestPassage.create! (
    [
      { user_id: user[0].id, test_id: test[0].id },
      { user_id: user[1].id, test_id: test[1].id },
      { user_id: user[1].id, test_id: test[0].id }
    ]
  )







