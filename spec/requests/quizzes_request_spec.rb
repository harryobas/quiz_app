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
        it "registers a quiz taker for a quiz" do
            post register_quiz_path, params: {quiz_taker: "foo"}
            expect(session[:quiz_taker]).to eq 'foo'
            expect(response).to redirect_to question_path
        end
        it 'does not register quiz taker without a name' do
            post register_quiz_path, params: {quiz_taker: nil}
            expect(response).to redirect_to root_path
        end
        it 'does not register quiz taker with empty name' do 
            post register_quiz_path, params: {quiz_taker: ''}
            expect(response).to redirect_to root_path

        end
    end
   
end
