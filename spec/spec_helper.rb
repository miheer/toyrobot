['lib', 'spec'].each do |folder|
    $LOAD_PATH.unshift File.dirname(__FILE__) + folder 
end
$0 = "/bin/bot"
ARGV.clear

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end

  result
end
