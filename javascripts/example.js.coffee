class ExampleView extends Backbone.View
  template: JST['templates/example']
  render: ->
    @$el.append @template(
      text: 'example'
      list: [1,2,3]
    )
    @


$ ->
  v = new ExampleView
    el: $('.example')
  v.render()