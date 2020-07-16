Rails.application.routes.draw do
  resources :quizzes, only: [:new]

  root to: "quizzes#new"

  get "/quizzes/question" => 'quizzes#question', as: 'question'

  post "/quizzes/register" => 'quizzes#register', as: 'register_quiz'
  post "/quizzes/validate" => 'quizzes#validate_question', as: 'quiz_question_validate'


end
