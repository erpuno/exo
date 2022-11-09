defmodule EXO.Client.Row do
  require EXO
  require BPE
  require NITRO
  def doc(), do: "Форма-рядок для відображення користувача системи."
  def id(), do: EXO.client()
  def new(name, _proc, _) do
      tel = "380"
      pid = "Користувач системи"
      NITRO.panel(id: :form.atom([:tr,name]), class: :td, body: [
        NITRO.panel(class: :column20,  body: NITRO.link(href: "user.htm?p=" <> tel, body: pid)),
        NITRO.panel(class: :column20,  body: ""),
        NITRO.panel(class: :column20,  body: ""),
        NITRO.panel(class: :column10,  body: "")
       ])
  end
end
