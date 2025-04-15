require 'test_helper'

class FitlogsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get fitlogs_index_url
    assert_response :success
  end

  test 'should get show' do
    get fitlogs_show_url
    assert_response :success
  end

  test 'should get new' do
    get fitlogs_new_url
    assert_response :success
  end

  test 'should get edit' do
    get fitlogs_edit_url
    assert_response :success
  end
end
