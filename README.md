# fantasy-simpsons-basketball

This is a fantasy basketball game simualtor which allows you to pick a tem of well known Simpson characters and pit them againt computer generated teams. It is written in Ruby for web browsers using HTML5.

## Project Requirements

1. You should have least five models. You do not have to have all of these built out on day one. But by the end of the week, you should have at least five models.

2. Some methods in your models. There should be at least twenty methods total in your models. These are to be used to better extract data from your tables. Think Flatiron BnB Lab

3. No APIs until you get approval from an instructor. The reason is because API's oftentimes leads you to learning the specific API really well, but not learning Rails that well. Rails is a more transferable skill. So stick with that.

4. Specs - there should be at least 10 specs in your project (five per person).

5. An analytics page - The main learning goal of this is to get you to write some interesting activerecord queries.

6. No JavaScript. Stay focused on Rails for this project - we'll have plenty of time this semeseter to cover JS topics

## Functionality

Users will need to create a profile with a valid username and password. On creation of their account they will need to create a team of five Simpson characters. Each user given a budget of £100 from which they must select 5 players all valued depending on their ranking. 

User's can visit characters player's profiles which will display all their relevant attributes e.g. name, height, quote, value and rating. Once team has been selected you're team is given an overall ranking and will be able to play against other computer generated teams. 

Match play is done through random generation. Each player will be assignes a randomly generated score which is weighted by their individual rating. This score corresponds to the number of baskets they score in the match. Done for each individual player form which a team score can be calculated and compared against their opponents. Win ratio and average match scored will be recorded and displayed in the users team profile. 

Players ratings can also improve depending on their performance in games this will also change their value so possible to sell players for more or less then initially bought.

## Models

- User
- Team
- Player
- Team Player
- Match
- (League)

## Stretch Goals

- Captain has double points 
- Teams can enter into leagues where they compete against 9 other teams
- Different user teams can compete against one another
- Killer web interface 
- Player ratings change depending on their game performances 

## Installation

## Contributing 

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
