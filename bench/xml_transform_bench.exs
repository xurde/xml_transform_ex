defmodule XmlTransformBench do
  use Benchfella
  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @simple "<root><document>test</document><version>1.3</version></root>"

  bench "using xmerl_xs" do
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
