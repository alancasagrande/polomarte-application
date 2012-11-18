class ProjectManagement.Routers.Projects extends Backbone.Router
  routes:
    "": "index"
    "/project/:id": "show"
    
  initialize: ->
    @collection = new ProjectManagement.Collections.Projects
    @collection.fetch()
    
  index: ->
    window.ProjectManagement.show(new ProjectManagement.Views.ProjectsIndex(collection: @collection))
    
  show: (id) ->
