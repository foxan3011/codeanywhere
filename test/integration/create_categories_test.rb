require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "get new category form and create category" do
        get new_category_path
        assert_template 'categories/new'
    #being able to create a category and then display it sw    
        assert_difference 'Category.count', 1 do
    #should be a difference in category count of one after do this action
            post_via_redirect categories_path, category: {name: "sports"}
    #remember the submission of a new form is handled by the create action which is http Post request
    #HTTP post request to the category's path which gets reacted to the create action
        end
        assert_template 'categories/index'
        assert_match "sports", response.body
    end
    
    test "invalid category submission results in failure"   do
        
   
        get new_category_path
        assert_template 'categories/new'
        assert_no_difference 'Category.count', 1 do
        post categories_path, category: {name: " "}
    end
        assert_template 'categories/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body' #errors.html.erb
 end
 end