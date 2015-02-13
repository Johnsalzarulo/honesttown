class PeopleController < ApplicationController

  def new
    @person = Person.new
  end

  def confirm
  end

  def results 
      @query = params['query']
      linksafe = @query.gsub(/\s+/, "+")
      @facebooklink = "https://www.facebook.com/search.php?q=#{linksafe}"
      page_data = HTTParty.get("https://www.facebook.com/search.php?q=#{linksafe}")
      @results = Nokogiri::HTML(page_data)
      @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
       @person = Person.last
       redirect_to "/people/#{@person.slug}"
    else
      search =  person_params[:name] + " " + person_params[:location]

      person = PgSearch.multisearch(search)
      slug = Person.find(person.first.searchable_id).slug

      redirect_to "/people/#{slug}"
    end
  end

  def index
  	@people = Person.all.reverse
  end

  def show
    @person = Person.friendly.find(params[:id])
    @tweet = Tweet.new
  end

  private
	def person_params
	 params.require(:person).permit(:name, :img_url, :location, :url)
	end


end
