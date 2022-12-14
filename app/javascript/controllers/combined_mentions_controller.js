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
          lookup: "title",
          menuShowMinLength: 1,
          menuItemLength: 10,
          values: this.fetchArticles
        },
        // Saved replies, perhaps a tag mention for your app.
        {
          trigger: "!",
          allowSpaces: true,
          lookup: "title",
          menuShowMinLength: 1,
          menuItemLength: 10,
          values: this.fetchSavedReplies
        },
        {
          trigger: ":",
          values: this.fetchEmojis,
          lookup: "name",
          allowSpaces: false,
          menuShowMinLength: 1,
          menuItemLimit: 10,
          menuItemTemplate: function(item) {
            return item.original.content + " " + item.original.name
          }
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

    if (mention.type && mention.type === "emoji") {
      this.editor.insertString(mention.content)
    } else if (mention.type && mention.type === "saved_reply") {
      this.editor.insertHTML(mention.content)
    } else {
      let attachment = new Trix.Attachment({
        content: mention.content,
        sgid: mention.sgid
      })

      this.editor.insertAttachment(attachment)
      this.editor.insertString(" ")
    }
  }

  _pasteHtml(html, startPos, endPos) {
    let range = this.editor.getSelectedRange()
    let position = range[0]
    let length = endPos - startPos

    this.editor.setSelectedRange([position - length, position])
    this.editor.deleteInDirection("backward")
  }

  fetchArticles(text, callback) {
    fetch(`/articles/mentions.json?query=${text}`)
      .then(response => response.json())
      .then(articles => callback(articles))
      .catch(error => callback([]))
  }

  fetchEmojis(text, callback) {
    fetch(`/emojis/mentions.json?query=${text}`)
      .then(response => response.json())
      .then(emojis => callback(emojis))
      .catch(error => callback([]))
  }

  fetchSavedReplies(text, callback) {
    fetch(`/saved_replies/mentions.json?query=${text}`)
      .then(response => response.json())
      .then(savedReplies => callback(savedReplies))
      .catch(error => callback([]))
  }
}
