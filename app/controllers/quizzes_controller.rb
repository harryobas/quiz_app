class QuizzesController < ApplicationController
    
    def new 
    end

    def register 
        redirect_to root_path, alert: "you must enter your name to continue" and return unless params[:quiz_taker].present? 
        session[:quiz_taker] = params[:quiz_taker]
        first_question = Question.all.first
        redirect_to question_path(first_question.id)
    end

    def question
        @question = Question.find(params[:id])
        
    end

    def validate_question
        current_ques_id = params[:current_ques_id].to_i
        session[:answers] ||= []
        if params[:answer] 
            session[:answers] << params[:answer] 
            next_question(current_ques_id)
        end
    end

    private 

    def next_question(ques_id)
        redirect_to question_path(ques_id+1)

    end
end
