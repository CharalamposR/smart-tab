{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'smart-tab:presstab': => @presstab()

  deactivate: ->
    @subscriptions.dispose()

  presstab: ->
    if editor = atom.workspace.getActiveTextEditor()
      console.log 'Got Editor'
      position = editor.getCursorBufferPosition()
      text = " "
      console.log 'Finding text'
      if position.column > 0
        startPosition = [position.row, position.column - 1]
        text = editor.getTextInBufferRange [startPosition, position]
      console.log '|' + text + '|'
      if  text in [' ', '', '\n']
        editor.insertText(" ")
      else
        editor.insertText("    ")
