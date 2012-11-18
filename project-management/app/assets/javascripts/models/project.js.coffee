class ProjectManagement.Project extends Backbone.RelationalModel
  urlRoot: "/api/projects"
  
  relations: [
    {
      type: Backbone.HasMany
      key: "tasks"
      relatedModel: "ProjectManagement.Task"
      collectionType: "ProjectManagement.Tasks"
    }
  ]
  
  done: ->
    return false if @get("tasks").length == 0
    
    for task in @get("tasks").models
      return false unless task.get("done")
      
    true
      
