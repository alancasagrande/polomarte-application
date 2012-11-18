window.ProjectManagement =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  
  initialize: ->
    new ProjectManagement.Routers.Projects
    Backbone.history.start()
    
  show: (view) -> 
    if @currentView
      @currentView.remove()
      @currentView.unbind()
      
    @currentView = view
    @currentView.render()
        
    $("#container").html(@currentView.el)

$(document).ready ->
  ProjectManagement.initialize()
