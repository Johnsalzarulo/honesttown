class PeopleController < ApplicationController

  def new
    @person = Person.new
  end

  def confirm

  end

    def results 
        @query = params['query']
        linksafe = @query.gsub(/\s+/, "+")
        @facebooklink= "https://www.facebook.com/search.php?q=#{linksafe}"
        page_data = HTTParty.get("https://www.facebook.com/search.php?q=#{linksafe}")
        @results = Nokogiri::HTML(page_data)

        @person = Person.new
    end

  def create
    @person = Person.new(person_params)
    if @person.save
       redirect_to '/people'
    else
      flash[:alert] = 'That person is already living in Honest Town.'
      redirect_to people_path
    end
  end

  def index
  	@people = Person.all.reverse
  end

  def show
    @person = Person.find(params[:id])

    # I DON'T KNOW WHERE TO PUT THESE ARRAYS OF OPTIONS

       @subject =[
            ['facial hair', 'facial hair'],
            ['alcohol consumption','alcohol consumption'],
            ['ambition','ambition'],
            ['common sense','common sense'],
            ['confidence','confidence'],
            ['driving','driving'],
            ['enthusiasm','enthusiasm'],
            ['Selfie game', 'Selfie game'],
            ['friendship','friendship'],
            ['generosity','generosity'],
            ['honesty','honesty'],
            ['humor','humor'],
            ['judgment','judgment'],
            ['loyalty','loyalty'],
            ['maturity','maturity'],
            ['modesty','modesty'],
            ['open mindedness','open mindedness'],
            ['outlook on life ','outlook on life '],
            ['party etiquette','party etiquette'],
            ['patience','patience'],
            ['personal hygiene','personal hygiene'],
            ['pretentiousness ','pretentiousness '],
            ['profanity','profanity'],
            ['reliability','reliability'],
            ['responsiveness','responsiveness'],
            ['selfishness','selfishness'],
            ['Love of sports', 'Love of sports'],
            ['thankfulness','thankfulness'],
            ['thoughtfulness','thoughtfulness'],
            ['use of social media','use of social media'],
            ['work ethic','work ethic'],
            ['religion', 'religion'],
            ['political ideology','political ideology'],
            ['politics', 'politics'],
            ['fashion sense', 'fashion sense'],
            ['oversharing', 'oversharing'],
            ['thoughts on ferguson', 'thoughts on ferguson'],
            ['love of Lady Gaga','love of Lady Gaga'],
            ['grooming habits', 'grooming habits'],
            ['Cooking', 'Cooking'],
            ['acoustic guitar playing at parties', 'acoustic guitar playing at parties'],
            ['Swag', 'Swag'],
            ['Responsiveness', 'Responsiveness'],
            ['gift-giving', 'gift-giving'],
            ['flirtatiousness','flirtatiousness'],
            ['Email etiquette', 'Email etiquette'],
            ['Tipping', 'Tipping'],
            ['Fantasy football skills', 'Fantasy football skills'],
            ['Retweets', 'Retweets'],
            ['Follow through', 'Follow through'],
            ['Schtick', 'Schtick'],
            ['Posting baby photos', 'Posting baby photos'],
            ['V neck collection', 'V neck collection']
          ]
          
      @verb =[
            ['can be','can be'],
            ['might be','might be'],
            ['is','is'],
            ['is not','is not'],
            ['is definitely','is definitely'],
            ['is most definitely','is most definitely']
          ]



      @adjective =[
          ['good','good'],
          ['sh*tty', 'sh*tty'], 
          ['fantastic','fantastic'],
          ['bleak','bleak'],
          ['in need of improvement','in need of improvement'],
          ['one hunna', 'one hunna'],
          ['great','great'],
          ['not great','not great'],
          ['too much','too much'],
          ['above average','above average'],
          ['below average','below average'],
          ['god awful','god awful'],
          ['wonderful','wonderful'],
          ['non-existent', 'non-existent'],
          ['annoying', 'annoying'],
          ['a problem', 'a problem'],
          ['unbearable', 'unbearable'],
          ['controversial', 'controversial'],
          ['zilch', 'zilch'],
          ['off the charts', 'off the charts'],
          ['come on', 'come on'],
          ['to go', 'to go'],
          ['backwards', 'backwards'],
          ['much improved','much improved'],
          ['bad','bad'],
          ['grimy', 'grimy'], 
          ['juvenile', 'juvenile'], 
          ['ummmm', 'ummmm'], 
          ['emo', 'emo'],
          ['proper', 'proper'],
          ['atrocious', 'atrocious'],
          ['inappropriate', 'inappropriate'], 
          ['obtuse', 'obtuse'],
          ['cute', 'cute'],
          ['tired', 'tired'],
          ['too much', 'too much'],
          ['over the top', 'over the top'],
          ['comical', 'comical'],
          ['f*cking insane', 'f*cking insane'],
          ['hypocritical', 'hypocritical'], 
          ['aggravating', 'aggravating'], 
          ['surprisingly good', 'surprisingly good'],
          ['subpar', 'subpar'],
          ['adequate', 'adequate'],
          ['dire', 'dire'],
          ['ambitious', 'ambitious'],
          ['getting better', 'getting better'], 
          ['average', 'average'], 
          ['magnificent', 'magnificent'],
          ['absurd', 'absurd'],
          ['exquisite', 'exquisite'],
          ['depressing', 'depressing'],
          ]

  end

  private
	def person_params
	 params.require(:person).permit(:name, :img_url, :location)
	end


end
