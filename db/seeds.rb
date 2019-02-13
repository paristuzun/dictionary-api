# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Category.destroy_all
Topic.destroy_all
Entry.destroy_all

10.times do
  user =  User.create!(
               username: Faker::Internet.username,
               password: Faker::Internet.password(10, 20, true))
end

 paris = User.create!(
             username: "Paris",
             password: "passw0rd"
 )


Category.create([{ name: 'today' },
                 { name: 'trending' },
                 { name: 'sports' },
                 { name: 'relationships'},
                 { name: 'politics' },
                 { name: 'travel' },
                 { name: 'science'},
                 { name: 'literature' },
                 { name: 'economy' }])

amazon = Topic.create!(title: "Why I cancelled Amazon Prime", user_id: paris.id )
headphones = Topic.create!(title: "Why use headphones than earphones", user_id: paris.id )
naturalfood = Topic.create!(title: "Natural food", user_id: paris.id )
edgelord = Topic.create!(title: "edgelord", user_id: paris.id )
desperationday = Topic.create!(title: "Desperation Day", user_id: paris.id )
twta = Topic.create!(title: "Things We Should Talk About", user_id: paris.id )
government = Topic.create!(title: "government shitdown", user_id: paris.id )
thirddate = Topic.create!(title: "If she hasn't kissed you by the third date", user_id: paris.id )
replyguy = Topic.create!(title: "reply guy", user_id: paris.id )

Entry.create!(body: "Amazon has been morphing from a discount store to a monopolist
convenience store/country club for a long time. The reason most people joined
Prime in the first place---free 2 day shipping—has been evaporating with fewer
items eligible for this perk. The dream that most consumers had—that they could
order a pack of gum and have it appear on their doorstep in two days—is gone.
What replaced it was Amazon slowly introducing devices—first the Kindle Fire,
then the failed Fire Phone, then the Fire Stick, and now the Alexa-enabled
Echo—designed to get customers hooked into the Amazon ecosystem,
so they continue to buy more Amazon products, even though these products are no
longer at discount prices. Another perk that was exciting at first, Amazon Prime Video,
has also become more restrictive, with almost no content available for free except
for Amazon’s own programming. Probably the best perk that came with Amazon",
topic_id: amazon.id, user_id: paris.id)

Entry.create!(body: "The experience when using headphones is vastly more enjoyable as to listening through earphones. The sound is more intense, increased bass, less background noise, which all help to give a enhanced sound. The headphones protrude so wearing with some clothing is harder, however they are also more comfortable. The charity and comprecision of the music is fulfilling and vivid, however it is down to each users preferences whether to use them or not. Headphones are generally more expensive and also when used in hotter weather, they can be less comfortable, though it depends on what brand is used, as some are much cooler than cheaper brands.",
topic_id: headphones.id, user_id: paris.id)

Entry.create!(body: "An often misleading marketing term with no legal definition (in the United States) used by food and beverage companies to convince buyers that the food is healthier and less processed than products without that label. Often mistaken for organic (which does have a legal definition and certification by the US Department of Agriculture) by consumers, “natural” has no particular characteristics that differentiate it from other products. One exception used to be “natural peanut butter” which had the characteristic of a layer of oil separated at the top of the jar due to a lack of hydrogenated oils. However, peanut butter companies have now introduced “no stir” versions of natural peanut butter with additives that cause the oil not to separate.",
topic_id: naturalfood.id, user_id: paris.id)

Entry.create!(body: "Someone, especially posting on the internet, who uses shocking and nihilistic speech and opinions that they themselves may or may not actually believe to gain attention and come across as a more dangerous and unique person. Most Edgelords are teenagers trying to seem overly cool and/or over-casually apathetic.",
topic_id: edgelord.id, user_id: paris.id)

Entry.create!(body: "February the 13th, i.e. the day before Valentines day. On which single people try desperately to find someone to spend Valentines day with.",
topic_id: desperationday.id, user_id: paris.id)

Entry.create!(body: "Ghosting, not the Twitter kind. The other kind, where you just disappear. Be a person, and just say goodbye.",
topic_id: twta.id, user_id: paris.id)

Entry.create!(body: "Why you're over 30 years old and still talk like you're 15.",
topic_id: twta.id, user_id: paris.id)

Entry.create!(body: "Why we can’t go to the corner store and buy one cigarette anymore.",
topic_id: twta.id, user_id: paris.id)

Entry.create!(body: "Vaccination, it's not just about your kids, it's about all the kids.",
topic_id: twta.id, user_id: paris.id)

Entry.create!(body: "The fact people need job experience to get a job that they need experience for.",
topic_id: twta.id, user_id: paris.id)

Entry.create!(body: "In a shithole (shithouse) country under one party rule, but where the ruling party somehow can't avoid a government shutdown. To celebrate the first anniversary of of the Trump Presidency, the Republicans led the US to a government shitdown.",
topic_id: government.id, user_id: paris.id)

Entry.create!(body: "She is there for the food.",
topic_id: thirddate.id, user_id: paris.id)

Entry.create!(body: "People who think that way think that it's a game of sorts. For some, it takes time, and if that person really cares about them, they wouldn't be putting much thought over this. Not everyone likes to get intimate quickly.",
topic_id: thirddate.id, user_id: paris.id)

Entry.create!(body: "No kiss at the end of the second date means she is not attracted to you.",
topic_id: thirddate.id, user_id: paris.id)

Entry.create!(body: "1. A man who behaves in an overly familiar way and is always replying to the social media messages of a woman he doesn't know or is barely acquainted with. 2. An annoying man who replies to social media messages, in general - whether this annoyance is due to a perceived know-it-all attitude, excessive familiarity, banal arguments that the annoyed user doesn't feel compelled to reply to again and again, or violation of some imagined pecking order.",
topic_id: replyguy.id, user_id: paris.id)


# 10.times do
#   topic = Topic.create!(description: Faker::GameOfThrones.quote,
#               title: Faker::Lorem.sentence(rand(4) + 1, true),
#               user_id: User.all.sample.id)
# end
#
#
# 10.times do
#   entry =  Entry.create!(body: Faker::GameOfThrones.quote,
#                 user_id: User.all.sample.id,
#                 topic_id: Topic.all.sample.id)
# end
