defmodule BPE.Login do
  require FORM
  require EXO

  def findPhone(phone, list) do
      :lists.foldl(fn x, acc -> 
         case EXO.client(x, :phone) == phone do
              true -> [x|acc]
              false -> acc
         end
      end, [], list)
  end

  def event(:init) do
      :nitro.clear(:stand)
      mod = BPE.Pass
      form = mod.new(mod, mod.id(), [])
      html = :form.new(form, mod.id(), [])
      :nitro.insert_bottom(:stand, html)
  end


  def event({:"Next",_}) do
      phone = :nitro.q(:number_phone_none)
      clients = :kvs.all '/exo/clients'
      res = findPhone(phone, clients)
      :io.format '~p', [res]
      case res do
          [x] -> case EXO.client(x, :type) do
                        "admin" -> :nitro.redirect("backoffice/reports.htm")
                        "consumer" -> :nitro.redirect("consumer/profile.htm")
                 end
          _ -> :nitro.redirect("index.html")
      end
  end
  def event({:"Close",_}), do: :nitro.redirect("index.html")
  def event(_), do: :ok

end

