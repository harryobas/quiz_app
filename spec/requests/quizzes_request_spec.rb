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
            expect(response).to redirect_to question_path(@ques_one.id)
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

    before do
        @ques_one = FactoryBot.create(:question,
        prompt: 'What is your first name?',
        ans_options: %w(peter paul foo boo jero))

        @ques_two = FactoryBot.create(:question,
        prompt: 'What is your favorite pet?',
        ans_options: %w(dog cat monkey snake frog))
    end

    describe "request question" do
        it 'renders a question' do
            get question_path(@ques_one.id)
            expect(response).to be_successful
            expect(response.body).to include('Question')
        end
    end

    describe 'validate question' do 
        context 'with answer option selected' do 
            it 'renders the next question' do 
                post quiz_question_validate_path, params: {answer: 'peter', current_ques_id: "#{@ques_one.id}"}
                expect(session[:answers]).to eql ['peter']
                expect(response).to redirect_to question_path(@ques_two.id)
            end
        end
    end
   
end
