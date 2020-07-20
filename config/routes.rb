Rails.application.routes.draw do
  resources :quizzes, only: [:new]

  root to: "quizzes#new"

  get "/quizzes/question/:id" => 'quizzes#question', as: 'question'

  post "/quizzes/register" => 'quizzes#register', as: 'register_quiz'
  post "/quizzes/validate" => 'quizzes#validate_question', as: 'quiz_question_validate'
  post "/quizzes/review" => 'quizzes#review_question', as: 'review_question'


end
