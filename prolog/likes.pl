% This is a program about who likes what kinds of food.

likes(john, pizza).                 % John likes pizza.
likes(joh, sushi).                  % John likes sushi.
likes(mary, sushi).                 % Mary likes sushi.
likes(paul, X) :- likes(john, X).   % Paul likes what John likes.
likes(_, icecream).                 % Everybody likes ice cream.