# Udacity Full-Stack Nanodegree
## Project 2 : Tournament Results
### by Justin John

## Overview

Project 2 implements a tournament results program. I used a PostgreSQL database to keep track of player and matches in a game tournament as well as a python module to interact with it. The three main files in this project are :

- **tourname.sql** : SQL file that creates the database and defines it's schema
- **tournament_test.py** : contains test functions to test against tournament.py
- **tournament.py** : tournament module that interacts with the database and completes the Swiss Pairing

## How to Run

Please ensure you have Python, Vagrant and VirtualBox installed. This project uses a pre-congfigured Vagrant virtual machine which has the PostgreSQL server installed. 

```bash
$ cd vagrant
$ vagrant up
$ vagrant ssh
```

Within the virtual machine change in to the shared directory by running

```bash
$ cd /vagrant/tournament
```

When running the project for the first time, no database will exist. To create it run the command
	
```bash
$ psql -f tournament.sql
```

To test the python module and ensure all the functions are working as expected run 
	
```bash
$ python tournament_test.py
```