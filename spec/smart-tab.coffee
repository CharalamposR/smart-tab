SmartTab = require '../lib/smart-tab'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "SmartTab", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    activationPromise = atom.packages.activatePackage('smart-tab')

    waitsForPromise ->
      atom.workspace.open()

  presstab ->
    editor = atom.workspace.getActiveTextEditor()
    point = editor.getCursorBufferPosition()
    point.column -= 1
    text =  editor.getTextInBufferRange(new Range r = (point, point))
    if text === (''|' ')
      editor.setTextInBufferRange(r, "tab")
    else
      editor.setTextInBufferRange(r, "spaces")
