class ProjectManagement.TaskView extends Backbone.View
  template: JST['projects/task']
  tagName: "li"
  
  events: ->
    "click .remove-task": "remove"
  
  render: ->
    $(@el).html(@template(task: @model))
    this
    
  remove: (event) ->
    event.stopPropagation()
    if confirm("Are you sure?")      
      @trigger("remove", @model)
      super()
      @unbind
