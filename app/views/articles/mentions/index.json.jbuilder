json.array! @articles do |article|
  json.extract! article, :id, :title
  json.type "article"
  json.sgid(article.attachable_sgid)
  json.content  render(partial: "articles/article", locals: {article: article}, formats: [:html])
end
