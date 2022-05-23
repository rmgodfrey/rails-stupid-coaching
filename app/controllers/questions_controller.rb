class QuestionsController < ApplicationController
  boilerplate = 'get dressed and go to work!'.freeze
  POSITIVE_ANSWER = 'Great!'.freeze
  ANSWER_TO_QUESTION = "Silly question, #{boilerplate}".freeze
  DEFAULT_ANSWER = "I don't care, #{boilerplate}".freeze

  def ask; end

  def answer
    @question = params[:question]
    @answer = if @question.capitalize == 'I am going to work'
                POSITIVE_ANSWER
              elsif @question.end_with?('?')
                ANSWER_TO_QUESTION
              else
                DEFAULT_ANSWER
              end
  end
end
