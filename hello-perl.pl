use 5.010;
use strict;
use warnings;

say "Olá sou um programa em Perl";

say "Qual é o seu nome? ";
my $nome = <STDIN>;
chomp $nome;
say "Olá $nome, como você está?";