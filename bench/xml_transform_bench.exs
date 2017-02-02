defmodule XmlTransformBench do
  use Benchfella
  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @sx """
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <ns2:Envelope xmlns:ns2="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns3="http://www.iata.org/IATA/EDIST">
      <ns2:Body>
        <ns2:Root>
          test
        </ns2:Root>
      </ns2:Body>
    </ns2:Envelope>"
  """
  @simple "<root>test</root>"

  bench "xml parsing" do
    IO.puts("-------------xml start------------------")
    {doc, _} = @simple |> :binary.bin_to_list |> :xmerl_scan.string
    doc
    |> template
    |> List.to_string
    |> IO.inspect
    IO.puts("-------------xml parse done-------------")
  end

  def template(e) do
    ["<h1>", :xmerl_xs.value_of(:xmerl_xs.select('.', e)), "</h1>"]
  end

  def get_text(e) do
    IO.inspect e
  end

  # def template(e = %xmlElement{name: 'title'}, etop) do
    # ["<h3>", value_of(select("title", etop)), " - ", xslapply( fn(a) -> template(a, etop) end, e), "</h3>"]
  # end
end
