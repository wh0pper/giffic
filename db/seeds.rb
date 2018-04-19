# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

node_list1 = [[
    "Once upon a time...", "rj", "https://media.giphy.com/media/N7Z2qy1y4QS6k/giphy.gif",
    [
      [
        "...there lived a young boy in a secluded forest village.", "rj", "https://media.giphy.com/media/xSlBkf2Yk1uV2/giphy.gif",
        [
          [ "He loved playing in the forest.", "rj", "https://media.giphy.com/media/UxTZDNv0Zej4s/giphy.gif" ],
          [ "He hated playing in the forest.", "rj", "https://media.giphy.com/media/UxTZDNv0Zej4s/giphy.gif" ]
        ]
      ],
      [
          "...on the cusp of fall, a young girl made a life-changing discovery.", "rj", "https://media.giphy.com/media/VXLQ1gZKPfhqU/giphy.gif",
          [
            [ "She realized she could control the weather with her hair", "rj", "https://media.giphy.com/media/az5FXj27l5lTi/giphy.gif" ],
            [ "She realized she could control the weather with her snatch", "rj", "https://media.giphy.com/media/az5FXj27l5lTi/giphy.gif" ]
          ]
      ]
    ]
]]


# node_list2 = [
#     [ "...there was a very angry Platypus named Dave", "rj", "https://media.giphy.com/media/FNpAjwtN1p1Yc/giphy.gif" ],
#     [ "...a man named Dave woke up one morning and looks in the mirror to discover he had grown a beak", "rj", "https://media.giphy.com/media/26n78QtJt4LHeNXi0/giphy.gif"]
# ]

story_list = [
    [ "Two Paths" ],
    [ "The Angry Platypus" ]
]

story_list.each do |title|
  Story.create(title: title)
end


node_list1.each do |sentence, signature, gif_url, next_nodes|
  node = Node.create( sentence: sentence, signature: signature, gif_url: gif_url )
  node.next_nodes_ids = ''
  next_nodes.each do |inner_sentence, inner_signature, inner_gif_url, inner_next_nodes|
    next_node = Node.create( sentence: inner_sentence, signature: inner_signature, gif_url: inner_gif_url )
    node.next_nodes_ids += (next_node.id.to_s + ',')
    next_node.next_nodes_ids = ''
    inner_next_nodes.each do |inner_sentence2, inner_signature2, inner_gif_url2|
      next_node2 = Node.create( sentence: inner_sentence2, signature: inner_signature2, gif_url: inner_gif_url2 )
      next_node.next_nodes_ids += (next_node2.id.to_s + ',')
    end
    next_node.save
  end
  node.save
  Story.first.nodes.push(node)
end

