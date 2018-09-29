# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create! (
    [
      { name: "guest", email: "savelov_vitaliy@mail.ru", password: "guest!", first_name: "Garry", last_name: "Guest" },
      { name: "admin", email: "savelowitaliy@gmail.com", password: "admin!", first_name: "Arnold", last_name: "Admin", type: "Admin"  }
    ]
  )

category = Category.create! (
    [
      { title: "Про животных" },
      { title: "Кулинария" },
      { title: "Сказки" },
    ]
  )

test = Test.create! (
    [
      { title: "Герои сказок",                  level: 1, category_id: category[2].id, author_id: user[1].id },
      { title: "Кулинария и продукты питания",  level: 2, category_id: category[1].id, author_id: user[1].id },
      { title: "Мир животных",                  level: 3, category_id: category[0].id, author_id: user[1].id }
    ]
  )

question = Question.create! (
    [
      { body: "В какой из этих басен и сказок лисице не удалось достичь желаемого?",  test_id: test[0].id },
      { body: "Кем стал братец Иванушка, ослушавшись сестрицу Аленушку?",             test_id: test[0].id },
      { body: "Какого из этих животных не было среди Бременских музыкантов?",         test_id: test[0].id },

      { body: "Какое мясо используется для супа харчо?",          test_id: test[1].id },
      { body: "Какое из этих блюд относится к украинской кухне?", test_id: test[1].id },
      { body: "Без какой крупы не сваришь гурьевской каши?",      test_id: test[1].id },

      { body: "Как называется место на берегу, где обитают тюлени?",            test_id: test[2].id },
      { body: "Как называется жилище волка?",                                   test_id: test[2].id },
      { body: "Разновидность какой из этих ящериц является крупнейшей в мире?", test_id: test[2].id }
    ]
  )

Answer.create! (
    [
      { body: "Ворона и лисица",  correct: false,  question_id: question[0].id },
      { body: "Лиса и виноград",  correct: true,   question_id: question[0].id },
      { body: "Колобок",          correct: false,  question_id: question[0].id },
      { body: "Кот и лиса",       correct: false,  question_id: question[0].id },

      { body: "Ягненочком",       correct: false,  question_id: question[1].id },
      { body: "Теленочком",       correct: false,  question_id: question[1].id },
      { body: "Козленочком",      correct: true,   question_id: question[1].id },
      { body: "Жеребеночком",     correct: false,  question_id: question[1].id },

      { body: "Осла",     correct: false,  question_id: question[2].id },
      { body: "Козла",    correct: true,   question_id: question[2].id },
      { body: "Петуха",   correct: false,  question_id: question[2].id },
      { body: "Кота",     correct: false,  question_id: question[2].id },

      { body: "Свинина",      correct: false,  question_id: question[3].id },
      { body: "Баранина",     correct: false,  question_id: question[3].id },
      { body: "Говядина",     correct: true,   question_id: question[3].id },
      { body: "Курятина",     correct: false,  question_id: question[3].id },

      { body: "Клецки",       correct: false,  question_id: question[4].id },
      { body: "Галушки",      correct: true,   question_id: question[4].id },
      { body: "Манты",        correct: false,  question_id: question[4].id },
      { body: "Пельмени",     correct: false,  question_id: question[4].id },

      { body: "Пшено",      correct: false,  question_id: question[5].id },
      { body: "Манка",      correct: true,   question_id: question[5].id },
      { body: "Гречка",     correct: false,  question_id: question[5].id },
      { body: "Рис",        correct: false,  question_id: question[5].id },

      { body: "Пастбище",    correct: false,  question_id: question[6].id },
      { body: "Лежбище",     correct: true,   question_id: question[6].id },
      { body: "Стойбище",    correct: false,  question_id: question[6].id },
      { body: "Стоянка",     correct: false,  question_id: question[6].id },

      { body: "Берлога",     correct: false,  question_id: question[7].id },
      { body: "Логово",      correct: true,   question_id: question[7].id },
      { body: "Нора",        correct: false,  question_id: question[7].id },
      { body: "Гнездо",      correct: false,  question_id: question[7].id },

      { body: "Геккон",       correct: false,  question_id: question[8].id },
      { body: "Варан",        correct: true,   question_id: question[8].id },
      { body: "Агама",        correct: false,  question_id: question[8].id },
      { body: "Игуана",       correct: false,  question_id: question[8].id }
    ]
  )
