IF DB_ID('Blog') IS NOT NULL
BEGIN
	USE master;
	ALTER DATABASE Blog SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE Blog;
END
GO

CREATE DATABASE Blog;
GO 

USE Blog;
GO

CREATE TABLE Authors (
	Id int IDENTITY PRIMARY KEY NOT NULL,
	NickName nvarchar(50) NOT NULL
)
GO

CREATE TABLE Themes (
	Id int IDENTITY PRIMARY KEY NOT NULL,
	[Name] nvarchar(30) NOT NULL UNIQUE
)
GO

CREATE TABLE Articles (
	Id int IDENTITY PRIMARY KEY NOT NULL,
	[Name] nvarchar(MAX) NOT NULL,
	[Date] datetime NOT NULL CHECK([Date] <= GETDATE()),
	AuthorFK int NOT NULL REFERENCES Authors(Id)
				 ON DELETE NO ACTION
				 ON UPDATE CASCADE,
	ThemeFK int NOT NULL REFERENCES Themes(Id)
				 ON DELETE NO ACTION
				 ON UPDATE CASCADE,
	ImgUrl nvarchar(150) NOT NULL,
  [Text] nvarchar(MAX) NOT NULL
)
GO

CREATE TABLE Tags (
	Id int IDENTITY PRIMARY KEY NOT NULL,
	[Name] nvarchar(30) NOT NULL UNIQUE
)
GO

CREATE TABLE ArticlesTags (
	ArticleId int NOT NULL REFERENCES Articles(Id) ON DELETE CASCADE,
  TagId int NOT NULL REFERENCES Tags(Id) ON DELETE CASCADE,
  PRIMARY KEY(ArticleId, TagId)
)
GO

--заполнение
INSERT INTO Authors (NickName)
VALUES ('Cam'), ('Barnabas H. Daru')

INSERT INTO Themes([Name])
VALUES ('lifestyle'), ('nature'), ('scienceNTechnologies'), ('sport')

INSERT INTO Tags([Name])
VALUES ('trip'), ('mountants'), ('forest')
GO

INSERT INTO ArticlesTags(ArticleId, TagId)
VALUES (1, 1), (1, 2), (1, 3), (2, 3)
GO

INSERT INTO Articles ([Name], [Date], AuthorFK, ThemeFK, ImgUrl, [Text])
VALUES ('Why ATVs Are Great to Ride in the Summer?', '2018-06-10', 1, 1, 'https://mudslinger.rumbleon.com/hs-fs/hubfs/shutterstock_1107246026.jpg?width=773&name=shutterstock_1107246026.jpg',
--1
'ATV Trails and Riding: My reasons why ATVs are made for summer

It’s summertime, and that means summer riding! It’s the perfect time of the year to go out and experience some adventure, and it’s an even better time to try your hand at different styles of riding.
What do I think is worth adventuring on? ATVs! ATV tires and durability allow you to explore areas that your traditional motorcycle can’t handle, and it’s a totally different experience. That doesn’t mean you have to swear loyalty to an ATV, either, it’s just a great chance to jump on one and experience just a little more of the unknown.

Here’s what makes ATVs in the summer such a blast:
Finding new, adventurous paths in nature:
If you live in a generally picturesque area, riding an ATV makes this a ton of fun. And even if you’re not in an area you would consider traditionally beautiful, there are always a variety of surprising spots you can find. An ATV allows you to go off-road, and it’s much easier to adjust and adapt to that an off-road bike. If you live in a particularly rocky area, ATVs are professionals at getting over those problematic paths.

Since the weather will be so fantastic (unless you’re an insanely hot area-sorry Arizona), you’ll be able to get a different view of your surrounding area. Maybe even a view you’ve never experienced because you’ve never really been able to off-road. Whatever the reasoning, ATVs are made for adventure and experience.
They`re awesome on camping trips:

It doesn’t matter if you prefer the nitty gritty style of camping, or you prefer to rent out a small cabin because it doesn’t change the fun that ATVs bring. When you go camping with family or friends, having an ATV along for the ride is always an excellent idea.

They can hold and carry more than a traditional motorcycle, and sure as heck of a lot more than an off-road bike. They’re great for lugging things around, won’t sink into muddy patches quickly, and are a great experience for everyone involved. While it depends on the ATV you have, most can handle more than one rider, which is great if you have a younger member of the family that can’t ride but still wants to be involved. I’ll just say an ATV makes those that don’t really enjoy camping a much bigger fan, once they get a ride.

It opens the door to even more lifelong friendships:
It doesn’t take any convincing to tell a rider what kind of friendships a set of wheels can create. And while you might love your motorcycle buddies, there’s always enough room in your life for new people. That’s especially true if you enjoy any kind of activity that gets your adrenaline pumping and gets you out there. The big difference between you motorcycle friends and potential ATV friends? One rides the road, and one doesn’t need or want one.

Whether Polaris, Yamaha, or a Honda ATV, these are becoming increasingly more popular, and that means establishing a group of friends to adventure with is getting easier or easier. It’s easy to bond with people when you’re all riding through muddy areas and trying not to spin out, or riding alongside a lake. It has its own, unique culture to get involved in. And with summer here and moods lifted, everyone’s out to find some new riding buddies.

It`s an awesome outlet for stress relief:

As I have previously mentioned before, 3-month long summer breaks are no longer the norms in our life. And while summer does bring a certain air of excitement, the everyday grind is still there, sometimes breathing down our necks. It can be even more frustrating when you get to see your kids having a blast during summer vacation, and you can’t join in because life must go on.

While your motorcycle can be a great stress reliever, any experience that gives you a sense of escape will help you achieve that. ATVs give you the ability to really remove yourself from everything else, and take things off-road. You’ll earn some silence that you may not have been able to experience in a long time, or get  time to ponder over things. The weather will be great, and sometimes it just takes removing yourself to decompress a little bit. And ATVs are great for helping you get there.

As much as it hurts to say, it`s a good exercise:
I know, I know, I don’t want to be “that” person. But just hear me out. The summer months are proven to see an increase in eating and lounging habits. That’s to say that summer can be a difficult time to get out and get some physical exercise in. The surprising things about ATVs are that they can easily exhaust you, especially if you’re riding them on rough and difficult terrains.

You need to have a lot of control over the vehicle, which usually involves you testing the limits on things like your arm strength. The best part is that you don’t even know you’re exerting anything physical, and those are honestly the best activities.

You don’t have to give up your bike. I know you love it, and it knows you love it, too. But summer is a time for exploration and new experiences, and riding an ATV should really be one of those things! You might be surprised by how much fun you have, and hey, any extra adrenaline addition in your life is always welcome, right?'),
--2
('Migratory birds aid the redistribution of plants to new climates', '2021-06-23', 2, 2, 'https://media.nature.com/lw800/magazine-assets/d41586-021-01547-1/d41586-021-01547-1_19246124.jpg',
'Birds that travel long distances can disperse seeds far and wide. An assessment of the timing and direction of European bird migration reveals how these patterns might affect seed dispersal as the planet warms.

The rapid pace of global warming and its effects on habitats raise the question of whether species are able to keep up so that they remain in suitable living conditions. Some animals can move fast to adjust to a swiftly changing climate. Plants, being less mobile, rely on means such as seed dispersal by animals, wind or water to move to new areas, but this redistribution typically occurs within one kilometre of the original plant1. Writing in Nature, González-Varo et al.2 shed light on the potential capacity of migratory birds to aid seed dispersal.

When the climate in a plant’s usual range becomes hotter than it can tolerate, it must colonize new, cooler areas that might lie many kilometres away. It is not fully clear how plants distribute their seeds across great distances, let alone how they cross geographical barriers. One explanation for long-distance seed dispersal is through transport by migratory birds. Such birds ingest viable seeds when eating fruit (Fig. 1) and can move them tens or hundreds of kilometres outside the range of a plant species3. In this mode of dispersal, the seeds pass through the bird’s digestive tract unharmed4,5 and are deposited in faeces, which provides fertilizer that aids plant growth. In the case of European migratory birds, for example, the direction of seed dispersal will depend on whether the timing of fruit production coincides with a bird’s southward trip to warmer regions around the Equator, or northward to cooler regions. Many aspects of this process have been a mystery until now.

González-Varo and colleagues report how plants might be able to keep pace with rapid climate change through the help of migrating birds. The authors analysed the fruiting times of plants, patterns of bird migration and the interactions between fruit-eating birds and fleshy-fruited plants across Europe. Plants with fleshy fruits were chosen for this study because most of their seed transport is by migratory birds6, and because fleshy-fruited plants are an important component of the woody-plant community in Europe. The common approach until now has been to predict plant dispersal and colonization using models fitted to abiotic factors, such as the current climate. González-Varo et al. instead analysed an impressive data set of 949 different seed-dispersal interactions between bird and plant communities, together with data on entire fruiting times and migratory patterns of birds across Europe. The researchers also analysed DNA traces from bird faeces to identify the plants and birds responsible for seed dispersal.

The authors hypothesized that the direction of seed migration depends on how the plants interact with migratory birds, the frequency of these interactions or the number of bird species that might transport seeds from each plant species. González-Varo and colleagues found that 86% of plant species studied might have seeds dispersed by birds during their southward trip towards drier and hotter equatorial regions in autumn, whereas only about one-third of the plant species might be dispersed by birds migrating north in spring. This dispersal trend was more pronounced in temperate plants than in the Mediterranean plant communities examined. These results are in general agreement with well-known patterns of fruiting times and bird migrations. For example, the fruit of most fleshy-fruited plants in Europe ripens at a time that coincides with when birds migrate south towards the Equator7.

Perhaps the most striking feature of these inferred seed movements is the observation that 35% of plant species across European communities, which are closely related on the evolutionary tree (phylogenetically related), might benefit from long-distance dispersal by the northward journey of migratory birds. This particular subset of plants tends to fruit over a long period of time, or has fruits that persist over the winter. This means that the ability of plants to keep up with climate change could be shaped by their evolutionary history — implying that future plant communities in the Northern Hemisphere will probably come from plant species that are phylogenetically closely related and that have migrated from the south. Or, to put it another way, the overwhelming majority of plant species that are dispersed south towards drier and hotter regions at the Equator will probably be less able to keep pace with rapid climate change in their new locations than will the few ‘winners’ that are instead dispersed north to cooler climates. This has implications for understanding how plants will respond to climate change, and for assessing ecosystem functions and community assembly at higher levels of the food chain. However, for seeds of a given plant species, more evidence is needed to assess whether passing through the guts of birds affects germination success.

To determine which birds might be responsible for the plant redistributions to cooler climates in the north, the authors categorized European bird migrants into Palaearctic (those that fly to southern Europe and northern Africa during their non-breeding season) and Afro-Palaearctic (those that winter in sub-Saharan Africa). Only a few common Palaearctic migrants, such as the blackcap (Sylvia atricapilla; Fig. 1) or blackbird (Turdus merula), provide most of this crucial dispersal service northwards to cooler regions across Europe. Because migratory birds are able to relocate a small, non-random subset of plants, this could well have a strong influence on the types of plant community that will form under climate-change conditions.

A major problem, however, is that the role of these birds in dispersing seeds over long distances is already at risk from human pressures and environmental changes8. Understanding these large-scale seed-dispersal interactions offers a way for targeted conservation actions to protect the areas that are most vulnerable to climate change. This could include boosting protection efforts in and around the wintering grounds of migratory birds — locations that are already experiencing a rise in human pressures, such as illegal bird hunting.

González-Varo and colleagues’ focus on seed dispersal across a Northern Hemisphere region means that, as with most ecological analyses, the results are dependent on scale, which can cause issues when interpreting data9. Because the Northern Hemisphere has more land area and steeper seasonal temperature gradients than the Southern Hemisphere does, seed-dispersal interactions might have different patterns from those occurring in the Southern Hemisphere or in aquatic systems.
or example, seed-eating birds from the genus Quelea migrate from the Southern Hemisphere to spend the dry season in equatorial West Africa, then move southwards again when the rains arrive. Their arrival in southern Africa usually coincides with the end of the wet season in this region, when annual grass seeds are in abundance. It will be worth investigating whether migratory birds in the Southern Hemisphere also influence the redistribution of plant communities during global warming. Likewise, exploring the long-distance dispersal of seeds of aquatic plants, such as seagrasses10 by water birds, is another area for future research that might benefit from González-Varo and colleagues’ methods.

This study provides a great example of how migratory birds might assist plant redistribution to new locations that would normally be difficult for them to reach on their own, and which might offer a suitable climate. As the planet warms, understanding how such biological mechanisms reorganize plant communities complements the information available from climate-projection models, which offer predictions of future species distributions.
')
