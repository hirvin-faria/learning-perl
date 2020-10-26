use 5.010;
use strict;
use warnings;
use feature qw(switch);
use Term::ANSIColor;

my $option;

while(1){
    &getMenu;
    print("DIGITE: ");
    $option = <STDIN>;
    given($option){
        when(0) {
            &exitGame;
            last;
        }

        when(1) {
            &start;
        }

        when(2) { 
            system("clear");
            &getRules;
        }

        default { 
            system("clear");
            print color('bold red');
            say("OPÇÃO INVALIDA"); 
            print color('reset');
        }
    }
}

sub getMenu {
    print color('bold green');
    say(" ______________________________________________________________________________");
    say("|                      __                         __                           |");
    say("|                     / /___  ____ _____     ____/ /___ _                      |");
    say("|                __  / / __ \\/ __ `/ __ \\   / __  / __ `/                      |");
    say("|               / /_/ / /_/ / /_/ / /_/ /  / /_/ / /_/ /                       |");
    say("|               \\____/\\____/\\__, /\\____/   \\__,_/\\__,_/                        |");
    say("|                          /____/                                              |");
    say("|              ___       ___       _       __                                  |");
    say("|             /   | ____/ (_)   __(_)___  / /_  ____ __________ _____          |");
    say("|            / /| |/ __  / / | / / / __ \\/ __ \\/ __ `/ ___/ __ `/ __ \\         |");
    say("|           / ___ / /_/ / /| |/ / / / / / / / / /_/ / /__/ /_/ / /_/ /         |");
    say("|          /_/  |_\\__,_/_/ |___/_/_/ /_/_/ /_/\\__,_/\\___/\\__,_/\\____/          |");
    say("|                                                                              |");
    say("|                                                                              |");
    say("|        MENU:                                                                 |");
    say("|        1 - START                                                             |");
    say("|        2 - REGRAS                                                            |");
    printf("|        ");
    print color('bold red');
    printf("0 - SAIR");
    print color('bold green');
    say("                                                              |");
    say("|                                                                              |");
    say("|                                                                              |");
    say("|    Desenvolvido por Hirvin Faria utilizando Perl | 2020                      |");
    say("|______________________________________________________________________________|");
    print color('reset');
}

sub exitGame {
    system("clear");

    say(" ______________________________________________________________________________"); 
    say("|                                                                              |");
    say("|                          Obrigado por Jogar                                  |");
    say("|______________________________________________________________________________|");
}

sub start {
    system("clear");
    my $secretNumber = int(rand(100));
    my $kick;
    my $retries = 1;
    my $score = 1000;

    while(1) {
        print color('blue');
        say("______________________________________________");
        say("Tentativa $retries");
        print color('reset');

        say("Qual é seu chute?");
        $kick = <STDIN>;

        chomp $kick;
        say("\n\nSeu chute foi $kick");
        if($kick < 0) {
            say("Você não pode chutar números negativos");
            continue;
        }


        if($kick == $secretNumber) {
            last;
        } elsif($kick > $secretNumber) {
            chomp $kick;
            print color('red');
            say("$kick é maior do que o número secreto!\n");
            print color('reset');
        } else {
            chomp $kick;
            print color('red');
            say("$kick é menor do que o número secreto!\n");
            print color('reset');
        }
        
        $retries++;
        $score = &getScore($score, $kick, $secretNumber) ;
    }

    system("clear");

    chomp $score;
    print color('bold green');
    say(" ______________________________________________________________________________");
    say("|                                                                              |");
    say("|                             Parabéns você acertou!                           |");
    say("|                            Sua pontuação foi de $score                          |");
    say("|______________________________________________________________________________| ");
    say("|                                                                              |");
    say("|         _____          __  __ ______    ______      ________ _____           |");
    say("|        / ____|   /\\   |  \\/  |  ____|  / __ \\ \\    / /  ____|  __ \\          |");
    say("|       | |  __   /  \\  | \\  / | |__    | |  | \\ \\  / /| |__  | |__) |         |");
    say("|       | | |_ | / /\\ \\ | |\\/| |  __|   | |  | |\\ \\/ / |  __| |  _  /          |");
    say("|       | |__| |/ ____ \\| |  | | |____  | |__| | \\  /  | |____| | \\ \\          |");
    say("|        \\_____/_/    \\_\\_|  |_|______|  \\____/   \\/   |______|_|  \\_\\         |");
    say("|                                                                              |");
    say("|______________________________________________________________________________|");
    print color('reset');
}

sub getRules {
    print color('italic blue');
    say(" _____________________________________________________________________________ ");
    say("|                                                                              |");
    say("|  Este é um game de adivinhação, nele você deve tentar acertar um número de 1 |");
    say("| a 100 gerado aleatoreamente. Quanto mais rápido você acertar o número, maior |");
    say("| será sua pontuação                                                           |");
    say("|______________________________________________________________________________|");
}

sub getScore {
    my($opScore, $opKick, $opSecretNumber) = @_;
    my $dawnscore = abs($opKick - $opSecretNumber);
    return $opScore - $dawnscore;
}