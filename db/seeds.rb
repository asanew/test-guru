# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Category.create!([ {title: 'Programm'}, {title: 'Design'}, {title: 'Database'} ])

users = User.create!([ {login: 'admin', password: Digest::SHA1.hexdigest('@dm1n')},
              {login: 'author1', password: Digest::SHA1.hexdigest('123')},
              {login: 'author2', password: Digest::SHA1.hexdigest('456')} ])

tests = Test.create!([ {title: 'Циклы', level: 0, category_id: cats[0].id, author_id: users[1].id},
              {title: 'Условия', level: 0, category_id: cats[0].id, author_id: users[1].id},
              {title: 'Цветовой круг', level: 1, category_id: cats[1].id, author_id: users[2].id},
              {title: 'Структура БД', level: 1, category_id: cats[2].id, author_id: users[2].id},
              {title: 'SQL JOIN', level: 2, category_id: cats[2].id, author_id: users[1].id} ])

quests = Question.create!([ {body: 'Перечислите виды циклов', test_id: tests[0].id},
                  {body: 'Как работает оператор if', test_id: tests[1].id},
                  {body: 'Какие цвета называются называются контрастными', test_id: tests[2].id},
                  {body: 'Что такое таблица', test_id: tests[3].id},
                  {body: 'Как задаётся условие соединения', test_id: tests[4].id} ])

answers = Answer.create!([ {body: 'if, case, else', correct: false, question_id: quests[0].id},
                {body: 'while, for', correct: true, question_id: quests[0].id},
                {body: 'Параллельно', correct: false, question_id: quests[1].id},
                {body: 'По одной из ветвей', correct: true, question_id: quests[1].id},
                {body: 'Соседние', correct: false, question_id: quests[2].id},
                {body: 'Противоположные', correct: true, question_id: quests[2].id},
                {body: 'То же, что и матрица', correct: false, question_id: quests[3].id},
                {body: 'Структура, задающая состав информации', correct: true, question_id: quests[3].id},
                {body: 'С помощью CONNECT', correct: false, question_id: quests[4].id},
                {body: 'С помощью ON', correct: true, question_id: quests[4].id} ])

TestResult.create!([ {user_id: users[0].id, test_id: tests[0].id},
                    {user_id: users[0].id, test_id: tests[1].id},
                    {user_id: users[1].id, test_id: tests[2].id},
                    {user_id: users[1].id, test_id: tests[3].id},
                    {user_id: users[1].id, test_id: tests[1].id},
                    {user_id: users[2].id, test_id: tests[4].id},
                    {user_id: users[2].id, test_id: tests[0].id},
                    {user_id: users[2].id, test_id: tests[2].id},
                    {user_id: users[2].id, test_id: tests[3].id} ])
