class ProjectManagement.Views.ProjectsIndex extends Backbone.View
  template: JST['projects/index']
  
  initialize: ->
    @collection.on("reset", @render, this)
    @collection.on("add", @render, this)
  
  render: ->
    $(@el).html(@template(projects: @collection))
    @el
