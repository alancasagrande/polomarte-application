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
