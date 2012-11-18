class ProjectManagement.Views.Project extends Backbone.View
  template: JST['projects/project']
  tagName: "li"
  
  events: ->
    "click .remove-project": "remove"
  
  render: ->
    $(@el).html(@template(project: @model))
    this
    
  remove: ->
    if confirm("Are you sure?")
      super()
      @trigger("remove", this)    
