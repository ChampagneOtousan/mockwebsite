require "sinatra"
require "faker"

$db = {"chris" => "rock", "dwayne" => "johnson", "rock" => "lee"}

get "/" do
  @person = Faker::Name.name
  erb :home
end

get "/about" do
  erb :about
end

get "/skills" do
  erb :skills
end

get "/results" do
  def getResult
    @result = $db["#{params[:search]}"]
    if @result == nil
      @result = "Please enter a valid search"
    end
  end
  getResult()
  erb :results
end
