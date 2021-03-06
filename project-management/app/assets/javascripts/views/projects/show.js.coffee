class ProjectManagement.ProjectsShowView extends Backbone.View
  template: JST['projects/show']
  
  events: ->
    "submit #new-task": "createTask"
  
  initialize: ->
    @model.on("change", @render, this)
    @model.on("add:tasks", @appendTask, this)
  
  remove: ->
    super()
    @model.off("change", @render)
    @model.off("add:tasks", @appendTask)  
  
  render: ->
    $(@el).html(@template(project: @model))
    @model.get("tasks").each(@appendTask, this)
    this
    
  appendTask: (task) ->
    taskView = new ProjectManagement.TaskView(model: task).render()
    taskView.on("remove", @removeTask, this)
    @$("#tasks").append(taskView.el)

  createTask: (event) ->
    event.preventDefault()
    attributes = 
      project_id: @model.get("id")
      name: $("#task-name").val()
      done: false
    @model.get("tasks").create attributes, 
      wait: true
      success: @handleSuccess
      error: @handleError
      
  handleSuccess: (task) ->
    $("#task-name").val("")
    $("#task-error").hide()
    
  handleError: ->
    $("#task-error").fadeIn()  
    
  removeTask: (task) ->
    task.destroy()
    