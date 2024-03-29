## POGOPI V2.2

Yet Another Pokemon Go Api.

Why ??
well, none is open sourced and/or allow cross-origin, 
and this a good starter for test app
with SQL, CRUD, Observable and API.

So, I do my own ...

Most of informations comes from:
- https://pokemon.gameinfo.io
- https://pokeapi.co/
- https://db.pokemongohub.net/

But honestly, i haven't copy it all ^^

I used js script the most to retrieve data.

There's more than needed for a tiny project or app !

## How it looks

You can have a look to it at
[pogo](http://pogo.kenko-shiatsu-grenoble.fr)

This project embed :
 - a tiny website at root of the project.
 - a tiny js game.

## License

No Licence ... free use !

## Improve

Many informations aren't needed in my project.

But feel free to fork and contribute !

## How to install

Download the project:

`git clone https://github.com/duduclx/pogopi.git`

or download as zip.

Add it at root of your project.

Edit the config file in:
 
 `api/Controller/config.php`
 
Then, install with script or with sql backup.

### With script
 
Edit `init.sql` to change the database name. 
 
Go to `http://your-server.com/`
and click !

### With sql backup

Import `install/backup/pogopi.sql` into your database !

### After install process

After installation, delete the install folder.
 
## database diagram

![database](www/images/Database_Diagram.png)

## How to use

api is reponding in jsonContent.

go to `http://your-server.com/api/`
to see the swagger documentation.

following request are possible:

abilitie:
 - api/abilitie/all
 - api/abilitie/id/{id}
 - api/abilitie/max
 - api/abilitie/name/{intl}/{name}

evolve:
 - api/evolve/all
 - api/evolve/max
 - api/evolve/id/{id}

fastmove:
 - api/fastmove/all
 - api/fastmove/id/{id}
 - api/fastmove/max
 - api/fastmove/name/{intl}/{name}
 - api/fastmove/type/{id-name}

generation:
 - api/generation/all
 - api/generation/id/{id}
 - api/generation/max
 - api/generation/name/{name}
 
mainmove:
 - api/mainmove/all
 - api/mainmove/id/{id}
 - api/mainmove/max
 - api/manimove/name/{intl}/{name}
 - api/mainmove/type/{id-name}
 
pokeball:
 - api/pokeball/all
 - api/pokeball/id/{id}
 - api/pokeball/generation/{id}
 - api/pokeball/max
 - api/pokeball/name/{name}
 
pokemon:
 - api/pokemon/max
 
pokemon-full:
 - api/pokemon/full/all/{id-order}
 - api/pokemon/full/generation/{id}
 - api/pokemon/full/id/{id}
 - api/pokemon/full/name/{intl}/{name}
 - api/pokemon/full/order/{id}
 - api/pokemon/full/type/{id-name} 

pokemon-tiny:
 - api/pokemon/tiny/all/{id-order}
 - api/pokemon/tiny/generation/{id}
 - api/pokemon/tiny/id/{id}
 - api/pokemon/tiny/name/{intl}/{name}
 - api/pokemon/tiny/order/{id}
 - api/pokemon/tiny/type/{id-name} 

team:
 - api/team/all
 - api/team/id/{id}
 - api/team/name/{intl}/{name}
 
type:
 - api/type/all
 - api/type/max
 - api/type/id/{id}
 - api/type/name/{intl}/{name}
 
version:
 - api/version

## TODO

add more request :
 - ... ??

missing attacks sound file:
 - exemple with fire_fang.wav who not exist but required
 - make a list of missing files
 
fix evolve chain :
 - pokemon id 265 / evolve id 110 should return two evolve chain
 - see https://pokemondb.net/pokedex/wurmple#dex-evolution

make it stronger :
 - thinking about using Symfony framework to rebuild the API.
 - integrate intl in the website
 - member/user and JWT api
 - enable sound in the game (but need cache system to prevent bug)
 
maintain it :
 - in the futur, add new generation of pokémons ...
 
have a more correct host service :
 - the used host service is quite slow 
 - do not use a subdomain anymore
