module Messages
    
    def get_messages(page_num=nil)
        if page_num == nil
            response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
        else
            response = self.class.get(api_url("message_threads?page=#{page_num}"), headers: { "authorization" => @auth_token })
        end
        @messages = JSON.parse(response.body)
    end

    def create_message(user_id, recipient_id, token, subject, message)
        response = self.class.post(api_url("messages"),
        body: {
                "user_id": user_id,
                "recipient_id": recipient_id,
                "token": token,
                "subject": subject,
                "stripped_text": message
                },
        headers: {"authorization" => @auth_token})
        puts response
    end
    
    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
        response = self.class.post(api_url("checkpoint_submissions"),
        body: {
                "checkpoint_id": checkpoint_id,
                "assignment_branch": assignment_branch,
                "assignment_commit_link": assignment_commit_link,
                "comment": comment,
                },
        headers: {"authorization" => @auth_token})
        puts response
    end
end