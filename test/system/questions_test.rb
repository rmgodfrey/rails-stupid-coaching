# test/system/questions_test.rb
require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "saying 'I am going to work' yields a positive response from the coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "Ask"

    assert_text "Great!"
  end

  test "saying 'I am going to work' with mixed capitalization yields a positive response from the coach" do
    visit ask_url
    fill_in "question", with: "I AM going to wORK"
    click_on "Ask"

    assert_text "Great!"
  end

  test "asking a question causes the coach to say 'silly question'" do
    visit ask_url
    fill_in "question", with: "Can I go shopping?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
  end
end
