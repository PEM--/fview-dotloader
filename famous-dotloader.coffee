FView.ready ->
  Engine = famous.core.Engine
  View = famous.core.View
  RenderNode = famous.core.RenderNode
  Surface = famous.core.Surface
  Modifier = famous.core.Modifier
  Transform = famous.core.Transform
  Transitionable = famous.transitions.Transitionable

  class DotLoader extends View
    DEFAULT_OPTIONS:
      height: 75
      dotsNumber: 7
      dotD: 10
      delay: 150
      isBgVisible: true
      bgClass: 'dotloader-background'
      dotClass: 'dotloader-dots'

    constructor: (@options) ->
      @constructor.DEFAULT_OPTIONS = @DEFAULT_OPTIONS
      super @options

      # Init our vars
      @joints = []
      @_height = @options.height
      @_amount = @options.dotsNumber
      @_D = @options.dotD
      @_delay = @options.delay

      # If icon background is set to be visible, show it
      @_createIconBg() if @options.isBgVisible

      # Create a chain of dots and then loop the rotation
      @_createChain()
      @_rotateChain()

    _createIconBg: ->
      iconBg = new Surface
        size: [@_height, @_height]
        classes: [@options.bgClass]
      @add iconBg

    _createChain: ->
      node = new RenderNode
      @add node

      sizeMod = new Modifier size: [this._height, this._height]

      sizeNode = node.add sizeMod
      factor = @_D / @_amount
      console.log 'Amount', @_amount
      console.log 'factor', factor
      for i in [0...@_amount]
        diam = Math.round factor * (@_amount - i)
        radius = Math.round diam / 2
        joint = new Surface
          size: [diam, diam]
          classes: [@options.dotClass]
          properties:
            borderRadius: "#{radius}px"
        joint.angle = new Transitionable 0
        joint.mod = new Modifier
          align: [.5, .5]
          origin: [.5, .5]
          size: [diam, @_height - (15 * @_height / 100) - i]
          transform: -> do (joint) ->
            Transform.rotateZ joint.angle.get()
        joint.counter = 2
        @joints.push joint
        sizeNode
          .add joint.mod
          .add joint
        console.log @joints

    _rotateChain: ->
      console.log @joints
      Engine.on 'prerender', =>
        for i in [0...@_amount]
          if (not @joints[i].angle.isActive()) and (not @joints[@_amount - 1].angle.isActive())
            angle = Math.PI * @joints[i].counter
            @joints[i].angle.set angle,
              duration: 1500 + i * @_delay
              curve: 'easeInOut'
            @joints[i].counter += 2

  FView.registerView 'DotLoader', DotLoader
