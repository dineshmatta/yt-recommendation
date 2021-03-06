class RecommendationService

    def initialize(params)
        RestClient.log = 'stdout'
        @url = params[:url]
        @keywords = params[:keywords]
    end

    def get_topics(url)
        ## Get the topics from Alchemy API
        results = AlchemyAPI::KeywordExtraction.new.search(url: url)

        ## Select the most relevant keyword with relevancy index >= 0.6
        #results.select! {|item| item["relevance"] >= "0.6"}
        results = results.take(1);

        ## parse the response and extract the keywords
        keywords = results.collect {|item| item["text"]}

        # if(keywords.length > 0)
        #   keywords = keywords.join('|').tr(" ", "+")
        # end

        return keywords[0]
    end

    def get_recommendations(keywords)
        videos = Yt::Collections::Videos.new
        videos_collection = videos.where(q: keywords, safe_search: 'none', order: 'relevance')
        p videos_collection.size

        videos_collection.map(&:id)
        ids = videos_collection.map(&:id).take(3)
        return ids
    end
end