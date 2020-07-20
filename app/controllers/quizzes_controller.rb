class QuizzesController < ApplicationController
    
    def new 
    end

    def register 
        unless params[:quiz_taker].present? 
            name_not_entered and return
        end
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

        unless params[:answer].present? 
            no_answer_selected(current_ques_id) and return
        end
        session[:answers] << params[:answer] 
        next_question(current_ques_id) 
    end

    def review_question 
        current_ques_id = params[:current_ques_id].to_i
        previous_question(current_ques_id)
    end

    private

    def next_question(ques_id)
        redirect_to question_path(ques_id+1)
    end

    def no_answer_selected(ques_id)
        redirect_to question_path(ques_id), alert: "you must select an answer to continue"
    end

    def name_not_entered
        redirect_to root_path, alert: "you must enter your name to continue"
    end

    def previous_question(ques_id)
        redirect_to question_path(ques_id-1)
    end

end
