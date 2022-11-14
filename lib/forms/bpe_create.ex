defmodule BPE.Create do
  require EXO
  require FORM

  def doc(), do: "Форма створення BPE/BPMN процесів."

  def id(), do: EXO.act()

  def new(name,_, _) do
      :erlang.put(:process_type_pi_none, "bpe_account")
      FORM.document(

	name: :form.atom([:pi,name]),

        sections: [ FORM.sec(name: ["Новий процес: "]) ],

        buttons:  [ FORM.but(id: :form.atom([:pi,:decline]),
			     title: "Відміна", class: :cancel,
			     postback: {:"Discard",[]} ),

    		    FORM.but(id: :form.atom([:pi,:proceed]),
                             title: "Створення", class: [:button,:sgreen],
                             sources: [:process_type],  postback: {:"Spawn",[]})],

        fields:   [ FORM.field(name: :process_type, id: :process_type, type: :select,
                             title: "Тип:", tooltips: [], default: :bpe_account,
                             options: [ FORM.opt(name: :bpe_account,
                                                 checked: true,
                                                 title: "Рахунок") ] ) ] )
  end

end