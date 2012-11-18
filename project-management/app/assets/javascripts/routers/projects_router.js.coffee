class ProjectManagement.ProjectsRouter extends Backbone.Router
  routes:
    "": "index"
    "projects": "index"
    "projects/:id": "show"
    
  initialize: ->
    @collection = new ProjectManagement.Projects
    
  index: ->    
    window.ProjectManagement.show(new ProjectManagement.ProjectsIndexView(collection: @collection))
    @collection.fetch()
    
  show: (id) ->
    model = ProjectManagement.Project.findOrCreate(id: id)
      
    model.fetch
      success: -> window.ProjectManagement.show(new ProjectManagement.ProjectShowView(model: model))
      error: ->
        alert("Project does not exist.")
        Backbone.history.navigate("projects", true)
        