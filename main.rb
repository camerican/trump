require 'sinatra'
require 'sinatra/activerecord'
require './model'

set :database, "sqlite3:trump.db" 

$html_title = "Trumptastic"

#ways to refer to donald
$donald = [
  "Donny",
  "Don",
  "El Hefe",
  "Trumpette",
  "Trumponé",
  "Teflon Don",
  "DJ Trump",
  "Mister T",
  "Our Hero"
]

$nav = {
  "/" => {
    erb: :index,
    nav: "Home",
    title: "Welcome"
  },
  "/hall" => {
    erb: :hall,
    nav: "Hall",
    title: "Hall of Losers"
  },
  "/jobs" => {
    erb: :jobs,
    nav: "Jobs",
    title: "Job Creator"
  },
  "/quotes" => {
    erb: :quotes,
    nav: "Quotes",
    title: "Classy Quotes"
  },
  "/team" => {
    erb: :team,
    nav: "Team",
    title: "Our Team"
  }
}

$nav.each do | route, hash |
  get route do 
    erb :layout, :layout => false do
      case hash[:erb]
      when :quotes
        @quotes = [
          #from goodreads
          "Get going. Move forward. Aim High. Plan a takeoff. Don't just sit on the runway and hope someone will come along and push the airplane. It simply won't happen. Change your attitude and gain some altitude. Believe me, you'll love it up here.",
          "As long as you are going to be thinking anyway, think big.",
          "Show me someone without an ego, and I'll show you a loser.",
          "When you are wronged repeatedly, the worst thing you can do is continue taking it--fight back!",
          "Sometimes your best investments are the ones you don't make.",
          "I try to learn from the past, but I plan for the future by focusing exclusively on the present. That's were the fun is.",
          "It doesn't hurt to get more education.",
          "What separates the winners from the losers is how a person reacts to each new twist of fate.",
          "Don't get sidetracked. If you do get sidetracked, get back on track as soon as possible. Ultimately sidetracking kills you.",
          "What's the point of having great knowledge and keeping them all to yourself?",
          "Everything in life is luck.",
          "I've read hundreds of books about China over the decades. I know the Chinese. I've made a lot of money with the Chinese. I understand the Chinese mind.",
          "Anyone who thinks my story is anywhere near over is sadly mistaken.",
          "You know, it really doesn't matter what (the media) write as long as you've got a young and beautiful piece of ass.",
          "It's a blip, not a catastrophe.",
          "Remember there's no such thing as an unrealistic goal - just unrealistic time frames.",
          "Watch, listen, and learn. You can’t know it all yourself. Anyone who thinks they do is destined for mediocrity.",
          "All of the women on The Apprentice flirted with me - consciously or unconsciously. That's to be expected.",
          "Criticism is easier to take when you realize that the only people who aren't criticized are those who don’t take risks.",
          "I only work with the best.",
          "There's an old German proverb to the effect that \"fear makes the wolf bigger than he is,\" and that is true.",
          "Rules are meant to be broken.",
          "I like to think of the word FOCUS as Follow One Course Until Successful.",
          "I've always felt that a lot of modern art is a con, and that the most successful painters are often better salesmen and promoters than they are artists.",
          #from wikiquote
          "Part of the beauty of me is that I am very rich.",
          "I have a great relationship with the blacks. I've always had a great relationship with the blacks.",
          "I'm not big on compromise. I understand compromise. Sometimes compromise is the right answer, but oftentimes compromise is the equivalent of defeat, and I don't like being defeated.",
          "The point is that you can't be too greedy.",
          "My philosophy is always to hire the best from the best.",
          "A well-educated black has a tremendous advantage over a well-educated white in terms of the job market.",
          "I said to the bankers, \"Listen, fellows, if I have a problem, then you have a problem. We have to find a way out or it's going to be a difficult time for both of us.\"",
          "I love beautiful women, and beautiful women love me. It has to be both ways.",
          "I don't like firing people. It's not a pleasant thing and it's sad.",
          "There's a beauty in those two words[, you're fired]. When you utter those words, there's very little that can be said. There's a succinctness to those words.",
          "Without passion, you don't have energy; without energy, you have nothing.",
          "Today I'm very proud of myself, because I've accomplished something that nobody else has been able to accomplish. I was just informed, while on the helicopter, that our president has finally released a birth certificate.",
          "I blame our leaders. Here we have China, ripping this country off like nobody's ever seen before, and we have the president of China come, a few months ago, to Washington, and we give him a state dinner.",
          "It's like in golf. A lot of people — I don't want this to sound trivial — but a lot of people are switching to these really long putters, very unattractive. It's weird. You see these great players with these really long putters, because they can't sink three-footers anymore. And, I hate it. I am a traditionalist. I have so many fabulous friends who happen to be gay, but I am a traditionalist.",
          "When Mexico sends its people, they're not sending their best... They're sending people that have lots of problems, and they're bringing those problems with us. They're bringing drugs. They're bringing crime. They're rapists. And some, I assume, are good people.",
          "I can't apologize for the truth.",
        ]
      when :jobs
        @orgpos = OrganizationPosition.all.sample
        #@orgpos = OrganizationPosition.offset(OrganizationPosition.count).first
      end
      erb hash[:erb]
    end
  end
end

# get "/" do 
#   erb :layout, :layout => false do
#     erb :index
#   end
# end

# get "/hall" do
#   erb :layout, :layout => false do
#     erb :hall
#   end
# end

# get "/jobs" do
#   erb :layout, :layout => false do
#     erb :jobs
#   end
# end

# get "/quotes" do
#   erb :layout, :layout => false do
#     erb :quotes
#   end
# end

# get "/team" do
#   erb :layout, :layout => false do
#     erb :team
#   end
# end
