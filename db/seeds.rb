epics = [
    "Github",
    "HUB",
    "Slack",
    "Scheduling",
    "Notion"
]
epics.each do |name|
  Epic.create( name: name )
end

github = Epic.find_by(name: "Github")

EpicList.create(name: 'Backend - access apps')

(github.id...(github.id + 4)).each do |i|
  EpicListsEpic.create(epic_id: i, epic_list_id: 1 )
end


Task.create(name: 'Task 1', description: 'sth sth', epic_id: github.id)

Question.create(description: 'Question 1', epic_id: 1)
Question.create(description: 'Question 2', epic_id: 1)
Question.create(description: 'Question 3', epic_id: 2)

Answer.create(description: 'Answer1', question_id: 1)
Answer.create(description: 'Answer2', question_id: 3)

UserAnswer.create(user_id: 1, answer_id: 1, response: true)
UserAnswer.create(user_id: 1, answer_id: 2,)

UserTask.create(user_id: 1, task_id: 2, done: true)
UserTask.create(user_id: 1, task_id: 2, done: false)


5.times do |i|
  User.create(email: "user#{i}@example.com", password: "qwerty")
end