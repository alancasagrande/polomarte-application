class ProjectManagement.ProjectView extends Backbone.View
  template: JST['projects/project']
  tagName: "li"
  
  events: ->
    "click .remove-project": "remove"
    "click": "show"
  
  render: ->
    $(@el).html(@template(project: @model))
    this
    
  show: ->
    Backbone.history.navigate("/projects/#{@model.get('id')}", true)
    
  remove: (event) ->
    event.stopPropagation()
    if confirm("Are you sure?")      
      @trigger("remove", @model)
      super()
      @unbind
