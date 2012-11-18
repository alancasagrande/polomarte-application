class ProjectManagement.ProjectsIndexView extends Backbone.View
  template: JST['projects/index']
  
  events: ->
    "submit #new-project": "createProject"
  
  initialize: ->
    @collection.on("reset", @render, this)
    @collection.on("add", @appendProject, this)
  
  remove: ->
    super()
    @collection.off("reset", @render)
    @collection.off("add", @appendProject)
  
  render: ->
    $(@el).html(@template())
    @collection.each(@appendProject, this)
    this
    
  appendProject: (project) ->
    projectView = new ProjectManagement.ProjectView(model: project).render()
    projectView.on("remove", @removeProject, this)
    $("#projects").append(projectView.el)

  createProject: (event) ->
    event.preventDefault()
    attributes = name: $("#project-name").val()
    @collection.create attributes, 
      wait: true
      success: @handleSuccess
      error: @handleError
      
  handleSuccess: ->
    $("#project-name").val("")
    $("#project-error").hide()
    
  handleError: (project) ->
    $("#project-error").fadeIn()
    
  removeProject: (project) ->
    project.destroy()
    