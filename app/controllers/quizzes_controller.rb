class QuizzesController < ApplicationController
    
    def new 
    end

    def register 
        redirect_to root_path, alert: "you must enter your name to continue" and return unless params[:quiz_taker].present? 
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
