require 'spec_helper'
require 'eco'

describe "Projects", :js => true do
  create_fail_message = "There is a problem with your request. Please check if all fields were filled properly."
  
  describe "index" do
    it "displays projects" do
      Project.create(name: "Project 1")
      visit "/#projects"
      page.should have_content("Project 1")
      page.should_not have_selector("#projects li .done")
    end
    
    it "displays a project as done" do
      project = Project.create(name: "Project 1")
      task = Task.create(name: "Task 1", done: true, project_id: project)
      visit "/"
      page.should have_selector("#projects li .done")
    end
    
    it "opens a project" do
      Project.create(name: "Project 1")
      visit "/"
      find("#projects li").click
      page.should have_content("Project 1")
      page.should have_content("Back to Projects")
    end
    
    it "creates a new project" do
      visit "/"
      fill_in "Project name", :with => "Project 2"
      click_button "Create"
      page.should_not have_content(create_fail_message)
      page.should have_content("Project 2")
    end

    it "does not create a new project with blank name" do
      visit "/"
      click_button "Create"
      page.should have_content(create_fail_message)
      page.should_not have_selector("#projects li")
    end
  end
end
