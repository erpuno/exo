defmodule Program.Row do
  require EXO
  require NITRO
  require FORM
  require BPE
  def id, do: EXO.program()
  def new(_name, program, _) do
      type = EXO.program(program, :type)
      date = EXO.program(program, :date)
      name = EXO.program(program, :name)
      formula = EXO.program(program, :formula)

      NITRO.panel(id: :form.atom([:tr,name]), class: :td, body: [
        NITRO.panel(class: :column20,  body: NITRO.link(href: "user.htm?p=" <> :nitro.to_binary(name), body: name)),
        NITRO.panel(class: :column20,  body: :nitro.to_binary type),
        NITRO.panel(class: :column20,  body: :nitro.compact date),
        NITRO.panel(class: :column20,  body: :nitro.compact formula),
       ])
  end
end
