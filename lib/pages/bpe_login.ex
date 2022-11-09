defmodule BPE.Login do
  require FORM

  def event(:init) do
      :nitro.clear(:stand)
      mod = BPE.Pass
      form = mod.new(mod, mod.id(), [])
      html = :form.new(form, mod.id(), [])
      :nitro.insert_bottom(:stand, html)
  end

  def event({:"Next",_}), do: :nitro.redirect("profile.htm")
  def event({:"Close",_}), do: :nitro.redirect("index.html")
  def event(_), do: :ok

end

