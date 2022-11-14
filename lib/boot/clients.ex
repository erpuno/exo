defmodule EXO.Clients do
  require EXO
  def clients() do
       date = :calendar.now_to_datetime :erlang.timestamp
       sample = [
          EXO.client(id: :kvs.seq([],[]), names: "Максим", phone: "380676631870", surnames: "Сохацький", type: :admin, status: :online, date: date),
          EXO.client(id: :kvs.seq([],[]), names: "Антон",  phone: "380676631871", surnames: "Волошко", type: :admin, status: :online, date: date),
          EXO.client(id: :kvs.seq([],[]), names: "МВС",    phone: "380676631872", surnames: "", type: :consumer, status: :online, date: date),
          EXO.client(id: :kvs.seq([],[]), names: "ГСЦ",    phone: "380676631873", surnames: "", type: :consumer, status: :online, date: date),
          EXO.client(id: :kvs.seq([],[]), names: "ЦІТ",    phone: "380676631874", surnames: "", type: :consumer, status: :online, date: date),
          EXO.client(id: :kvs.seq([],[]), names: "ДНДІ",   phone: "380676631875", surnames: "", type: :consumer, status: :online, date: date),
       ]
       :lists.map fn x -> :kvs.append x, '/exo/clients' end, sample
   end

  def programs() do
      date = :calendar.now_to_datetime :erlang.timestamp
      sample = [
          EXO.program(id: :kvs.seq([],[]), name: "БАЗОВИЙ", type: :telecom, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "СТАНДАРТ", type: :telecom, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "РОЗРИШЕНИЙ", type: :telecom, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "БАЗОВИЙ", type: :electricity, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "СТАНДАРТ", type: :electricity, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "РОЗРИШЕНИЙ", type: :electricity, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "БАЗОВИЙ", type: :gas, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "СТАНДАРТ", type: :gas, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "РОЗРИШЕНИЙ", type: :gas, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "БАЗОВИЙ", type: :oil, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "СТАНДАРТ", type: :oil, date: date),
          EXO.program(id: :kvs.seq([],[]), name: "РОЗРИШЕНИЙ", type: :oil, date: date),
      ]
      :lists.map fn x -> :kvs.append x, '/exo/tariffs' end, sample

  end

end