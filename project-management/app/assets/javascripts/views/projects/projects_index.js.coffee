class ProjectManagement.Views.ProjectsIndex extends Backbone.View
  template: JST['projects/index']
  
  events: ->
    "submit #new-project": "create"
  
  initialize: ->
    @collection.on("reset add remove", @render, this)
  
  render: ->
    $(@el).html(@template(projects: @collection))
    @el

  create: (event) ->
    event.preventDefault()
    @collection.create(name: $("#project-name").val())