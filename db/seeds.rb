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

tests = Test.create!([ {title: 'Циклы', level: 0, category: cats[0], author: users[1]},
              {title: 'Условия', level: 0, category: cats[0], author: users[1]},
              {title: 'Цветовой круг', level: 1, category: cats[1], author: users[2]},
              {title: 'Структура БД', level: 1, category: cats[2], author: users[2]},
              {title: 'SQL JOIN', level: 2, category: cats[2], author: users[1]} ])

quests = Question.create!([ {body: 'Перечислите виды циклов', test: tests[0]},
                  {body: 'Как работает оператор if', test: tests[1]},
                  {body: 'Какие цвета называются называются контрастными', test: tests[2]},
                  {body: 'Что такое таблица', test: tests[3]},
                  {body: 'Как задаётся условие соединения', test: tests[4]} ])

Answer.create!([ {body: 'if, case, else', correct: false, question: quests[0]},
                {body: 'while, for', correct: true, question: quests[0]},
                {body: 'Параллельно', correct: false, question: quests[1]},
                {body: 'По одной из ветвей', correct: true, question: quests[1]},
                {body: 'Соседние', correct: false, question: quests[2]},
                {body: 'Противоположные', correct: true, question: quests[2]},
                {body: 'То же, что и матрица', correct: false, question: quests[3]},
                {body: 'Структура, задающая состав информации', correct: true, question: quests[3]},
                {body: 'С помощью CONNECT', correct: false, question: quests[4]},
                {body: 'С помощью ON', correct: true, question: quests[4]} ])

# Без модели многие-ко-многим нельзя выполнить задание про
# пользователей и пройденные ими тесты, т.к. каждый пользователь
# может проходить множество тестов и каждый тест может проходить
# много пользователей, до этого у нас был только один аттрибут,
# связывающий тест и пользователя - автор, но там связь
# один-ко-многим и автор - это не тот, кто тест проходит

# Заполнение данными нужно для тестирования корректности работы

TestResult.create!([ {user: users[0], test: tests[0]},
                    {user: users[0], test: tests[1]},
                    {user: users[1], test: tests[2]},
                    {user: users[1], test: tests[3]},
                    {user: users[1], test: tests[1]},
                    {user: users[2], test: tests[4]},
                    {user: users[2], test: tests[0]},
                    {user: users[2], test: tests[2]},
                    {user: users[2], test: tests[3]} ])
