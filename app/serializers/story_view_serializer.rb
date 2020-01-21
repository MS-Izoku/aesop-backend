class StoryViewSerializer
    include FastJsonapi::ObjectSerializer
    attributes(
        :title,
        :pitch,
        :high_concept
    )
end