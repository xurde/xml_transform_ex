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
  @simple "<root><document>test</document><version>1.3</version></root>"

  bench "xml parsing" do
    IO.puts("-------------xml start------------------")
    {doc, _} = @simple |> :binary.bin_to_list |> :xmerl_scan.string

    doc
    |> template
    |> List.to_string
    |> IO.inspect
    IO.puts("-------------xml parse done-------------")
  end

  def template(e = xmlElement([{:name, :root}])) do
    ["<h1>", :xmerl_xs.xslapply(&template/1, e), "</h1>"]
  end

  def template(e = xmlElement([{:name, :document}])) do
    ["<h3>", :xmerl_xs.value_of(:xmerl_xs.select('.', e)), "</h2>"]
  end

  def template(e = xmlElement([{:name, :version}])) do
    ["<h3>", :xmerl_xs.value_of(:xmerl_xs.select('.', e)), "</h3>"]
  end



end
