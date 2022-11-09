defmodule BPE.Login do
  require FORM

  def event(:init) do
      :nitro.clear(:stand)
      mod = BPE.Pass
      form = mod.new(mod, mod.id(), [])
      html = :form.new(form, mod.id(), [])
      :nitro.insert_bottom(:stand, html)
  end

  def event({:"Next",_}) do
      case {:nitro.q(:number_phone_none),:nitro.q(:auth_phone_none)} do
          {"380676631870","123"} -> :nitro.redirect("backoffice/reports.htm")
                               _ -> :nitro.redirect("consumer/profile.htm")
      end
  end
  def event({:"Close",_}), do: :nitro.redirect("index.html")
  def event(_), do: :ok

end

