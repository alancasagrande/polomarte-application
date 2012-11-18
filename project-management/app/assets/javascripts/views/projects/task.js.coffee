class ProjectManagement.TaskView extends Backbone.View
  template: JST['projects/task']
  tagName: "li"
  
  initialize: ->
    @model.on("change:done", @render, this)
  
  events: ->
    "click .remove-task": "remove"
    "click .mark-task": "done"
  
  render: ->
    $(@el).html(@template(task: @model))
    this
    
  done: ->
    @model.set("done", @$(".mark-task").attr("checked") is "checked")
    @model.save()
    
  remove: (event) ->
    event.stopPropagation()
    if confirm("Are you sure?")      
      @trigger("remove", @model)
      super()
      @unbind
      
