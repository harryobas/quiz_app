class QuizzesController < ApplicationController
    
    def new 
    end

    def register 
        session[:quiz_taker] = params[:quiz_taker]
        redirect_to question_path
    end

    def question
        @questions ||= Question.all 
        @question = @questions.first
        @questions = @questions - [@question] if @question 
    end

    def validate
    end
end
