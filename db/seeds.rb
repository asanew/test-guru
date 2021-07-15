# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([ {title: 'Programm'}, {title: 'Design'}, {title: 'Database'} ])

User.create([ {login: 'admin', password: Digest::SHA1.hexdigest('@dm1n')},
              {login: 'author1', password: Digest::SHA1.hexdigest('123')},
              {login: 'author2', password: Digest::SHA1.hexdigest('456')} ])

Test.create([ {title: 'Циклы', level: 0, category_id: 1, author_id: 1},
              {title: 'Условия', level: 0, category_id: 1, author_id: 1},
              {title: 'Цветовой круг', level: 1, category_id: 2, author_id: 2},
              {title: 'Структура БД', level: 1, category_id: 3, author_id: 2},
              {title: 'SQL JOIN', level: 2, category_id: 3, author_id: 1} ])

Question.create([ {body: 'Перечислите виды циклов', test_id: 1},
                  {body: 'Как работает оператор if', test_id: 2},
                  {body: 'Какие цвета называются называются контрастными', test_id: 3},
                  {body: 'Что такое таблица', test_id: 4},
                  {body: 'Как задаётся условие соединения', test_id: 5} ])

Answer.create([ {body: 'if, case, else', correct: false, question_id: 1},
                {body: 'while, for', correct: true, question_id: 1},
                {body: 'Параллельно', correct: false, question_id: 2},
                {body: 'По одной из ветвей', correct: true, question_id: 2},
                {body: 'Соседние', correct: false, question_id: 3},
                {body: 'Противоположные', correct: true, question_id: 3},
                {body: 'То же, что и матрица', correct: false, question_id: 4},
                {body: 'Структура, задающая состав информации', correct: true, question_id: 4},
                {body: 'С помощью CONNECT', correct: false, question_id: 5},
                {body: 'С помощью ON', correct: true, question_id: 5} ])

TestResult.create([ {user_id: 1, test_id: 1},
                    {user_id: 1, test_id: 2},
                    {user_id: 2, test_id: 3},
                    {user_id: 2, test_id: 4},
                    {user_id: 2, test_id: 2},
                    {user_id: 3, test_id: 5},
                    {user_id: 3, test_id: 1},
                    {user_id: 3, test_id: 3},
                    {user_id: 3, test_id: 4} ])
