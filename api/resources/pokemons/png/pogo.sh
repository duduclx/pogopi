#!/bin/bash

for i in `seq 1 9`;
do
        wget https://assets.pokemon.com/assets/cms2/img/pokedex/full/00$i.png
done

for i in `seq 10 99`;
do
        wget https://assets.pokemon.com/assets/cms2/img/pokedex/full/0$i.png
done

for i in `seq 100 808`;
do
        wget https://assets.pokemon.com/assets/cms2/img/pokedex/full/$i.png
done