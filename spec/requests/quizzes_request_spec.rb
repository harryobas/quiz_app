require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
   
    describe "request new" do
        it "starts a new quiz" do
            get new_quiz_path
            expect(response).to be_successful 
            expect(response.body).to include('Start Quiz') 
        end    
    end
    describe "request register" do
        it "registers a quizee a quiz" do
            post register_quiz_path, params: {quiz_taker: "foo"}
            expect(session[:quiz_taker]).to eq 'foo'
            expect(response).to redirect_to question_path
        end
    end
end
