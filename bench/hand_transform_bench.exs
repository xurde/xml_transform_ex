defmodule HandTransformBench do
  use Benchfella
  require Record

  bench "use Regex" do
    IO.puts("-------------xml start------------------")
    {:ok, xml} = File.read "as.xml"
    ns2 = Regex.replace(~r/(<\/?ns2:.*?>)/s, xml, "")
    ns3 = Regex.replace(~r/(<ns3:)/s, Regex.replace(~r/(<\/ns3:)/s, ns2, "</"), "<")
    IO.inspect ns3


    IO.puts("-------------xml parse done-------------")
  end

end
