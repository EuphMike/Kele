module Roadmap 
    def get_roadmap
        response = self.class.get(api_url("roadmaps/31"), headers: { "authorization" => @auth_token })
        @roadmap_data = JSON.parse(response.body)
    end
    
    def get_checkpoint
        response = self.class.get(api_url("checkpoints/id"), headers: { "authorization" => @auth_token })
        @checkpoint_data = JSON.parse(response.body)
    end
end
