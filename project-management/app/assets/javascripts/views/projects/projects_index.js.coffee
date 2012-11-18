class ProjectManagement.Views.ProjectsIndex extends Backbone.View
  template: JST['projects/index']
  
  events: ->
    "submit #new-project": "create"
  
  initialize: ->
    @collection.on("reset", @render, this)
    @collection.on("add", @append, this)
  
  render: ->
    $(@el).html(@template())
    @collection.each(@append, this)
    this
    
  append: (project) ->
    projectView = new ProjectManagement.Views.Project(model: project).render()
    projectView.on("remove", @remove, this)
    $("#projects").append(projectView.el)

  create: (event) ->
    event.preventDefault()
    @collection.create(name: $("#project-name").val())
    $("#project-name").val("")
    
  remove: (projectView) ->
    @collection.remove(projectView.model)
    projectView.model.destroy()
    
    
    