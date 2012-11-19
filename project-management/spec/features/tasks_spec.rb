require 'spec_helper'
require 'eco'

describe "Project Tasks", :js => true do
  create_fail_message = "There is a problem with your request. Please check if all fields were filled properly."
  
  describe "show" do
    it "displays tasks" do
      project = Project.create(name: "Project 1")
      task = Task.create(name: "Task 1", done: false, project_id: project)
      visit "/#projects/#{project.id}"
      page.should have_content("Project 1")
      page.should have_content("Task 1")
    end
    
    it "creates a new task" do
      project = Project.create(name: "Project 1")
      visit "/#projects/#{project.id}"
      fill_in "Task name", :with => "Task 2"
      click_button "Create"
      page.should_not have_content(create_fail_message)
      page.should have_content("Task 2")
    end
    
    it "does not create a new task with blank name" do
      project = Project.create(name: "Project 1")
      visit "/#projects/#{project.id}"
      click_button "Create"
      page.should have_content(create_fail_message)
      page.should_not have_selector("#tasks li")
    end
    
    it "marks a task as done" do
      project = Project.create(name: "Project 1")
      task = Task.create(name: "Task 1", done: false, project_id: project)
      visit "/#projects/#{project.id}"
      find("#tasks li .mark-task").set(true)
      page.should have_selector("#tasks li .done")
      task.reload
      task.done.should be_true
    end
    
    it "marks a task as undone" do
      project = Project.create(name: "Project 1")
      task = Task.create(name: "Task 1", done: true, project_id: project)
      visit "/#projects/#{project.id}"
      find("#tasks li .mark-task").set(false)
      page.should_not have_selector("#tasks li .done")
      task.reload
      task.done.should be_false
    end
  end
end
