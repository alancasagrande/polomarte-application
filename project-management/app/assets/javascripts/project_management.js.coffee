window.ProjectManagement =
  initialize: ->
    new ProjectManagement.ProjectsRouter
    Backbone.history.start()

  show: (view) -> 
    if @currentView
      @currentView.remove()
      @currentView.unbind()
      
    @currentView = view
    @currentView.render()
        
    $("#container").html(@currentView.el)

$ ->
  ProjectManagement.initialize()
