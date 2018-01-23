# Tournament

  Python application using PostGreSQL Database to keep track of players and matches in a game tournament.

# Files

    tournament.py - set of functions, to run swiss style tournament
    tournament_test.py - tests to run, call the functions in tournament.py
    tournament.sql - SQL for creating DB objects: tables, views
    Functions in tournament.py
  
 #Prerequisites
    
    Python
    PostgreSQL
    
 #Installation
    
    Download and unzip all of the files in this repo into the same directory.
    From the command line, navigate to the directory into which you unzipped all the files from this repo.
    Start the psql command line client, which talks to the PostgreSQL database, by typing "psql" and pressing enter.
    Create the database by typing "\i tournament.sql" into the psql interpreter and pressing enter.
    Exit psql interpreter: "\q"
    Now type: "python tournament_test.py" to run the test suite. 

#Tournament API

  registerPlayer(name)
Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different   players may have the same names but will receive different ID numbers.
  
  countPlayers()
Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

  deletePlayers()
Clear out all the player records from the database.

  reportMatch(winner, loser)
Stores the outcome of a single match between two players in the database.

  deleteMatches()
Clear out all the match records from the database.

  playerStandings()
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

  swissPairings()
Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.

#Test Results:
$ python tournament_test.py
1. Old matches can be deleted.
2. Player records can be deleted.
Extra credit: Tournament records can be deleted.
Extra credit: After adding a tournament, countTournaments() returns 1.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
Extra credit: Tied players are ordered by opponent match wins.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!

#Author
Olga Novgorodsky

