import { Controller } from "@hotwired/stimulus"
import Tribute from "tributejs"
import Trix from "trix"

// Connects to data-controller="combined-mentions"
export default class extends Controller {
  static targets = [ "field" ]

  connect() {
    this.editor = this.fieldTarget.editor
    this.initializeTribute()
  }

  initializeTribute() {
    this.tribute = new Tribute({
      collection: [
        // Article mentions, but perhaps this is a user mention for your app.
        {
          trigger: "@",
          allowSpaces: true,
          lookup: "key",
          menuShowMinLength: 1,
          menuItemLength: 10,
          values: [
            { key: "John Doe", value: "johndoe" },
            { key: "Jane Doe", value: "janedoe" }
          ]
        },
        {
          trigger: "!",
          allowSpaces: true,
          lookup: "key",
          menuShowMinLength: 1,
          menuItemLength: 10,
          values: [
            { key: "Alex Smith", value: "alexsmith" },
            { key: "John Smith", value: "johnsmit" }
          ]
        }
      ]
    });

    this.tribute.attach(this.fieldTarget)
    this.fieldTarget.addEventListener("tribute-replaced", this.replaced)
    this.tribute.range.pasteHtml = this._pasteHtml.bind(this)
  }

  disconnect() {
    this.tribute.detach(this.fieldTarget)
  }

  replaced(event) {
    let mention = event.detail.item.original

    this.editor.insertHTML(`<a href="/users/${mention.value}">${mention.key}</a>`)
  }

  _pasteHtml(html, startPos, endPos) {
    let range = this.editor.getSelectedRange()
    let position = range[0]
    let length = endPos - startPos

    this.editor.setSelectedRange([position - length, position])
    this.editor.deleteInDirection("backward")
  }
}
