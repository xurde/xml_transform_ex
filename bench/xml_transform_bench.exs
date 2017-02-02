defmodule XmlTransformBench do
  use Benchfella
  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @xls """
  <xsl:template match="title">
    <div align="center">
      <h1><xsl:value-of select="." /></h1>
    </div>
  </xsl:template>
  """


  bench "xml parsing" do
    simple2 = "<Root>test</Root>"
    simple = "<Root><CoreQuery><Destination><Code>JFK</Code></Destination></CoreQuery></Root>"
    {doc, _} = simple2 |> :binary.bin_to_list |> :xmerl_scan.string

    template(doc)



    IO.puts("xml parse done")
  end

  def template(e) do
    ["<h3>", :xmerl_xs.xslapply( &get_text/1, e), "</h3>"]
  end

  def get_text(e) do
    IO.inspect e
  end

  # def template(e = %xmlElement{name: 'title'}, etop) do
    # ["<h3>", value_of(select("title", etop)), " - ", xslapply( fn(a) -> template(a, etop) end, e), "</h3>"]
  # end
end
