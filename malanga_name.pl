#!/usr/bin/perl -w 

#use Data::Dumper;

system(clear);
$numero_parole=3;
$titolo;

$seed_1=`date +%l`;
$seed_2=`date +%S`;
$seed_3=`date +%j`;

#print"$seed_1\t$seed_2\t$seed_3\n";

$rand_seed=$seed_2/$seed_1;
#print"rand_seed = $rand_seed\n";

$ARGC=@ARGV;

if($ARGC==1){
	if($ARGV[0]eq"-h"){
		print_help();
	}
	elsif($ARGV[0]eq"-r"){
		$numero_parole=int(rand($rand_seed));
		if($numero_parole==0){
			$numero_parole=3;
		}
	}
	else{
		print"\nriprova dio cane ma sta tento dio troia merda del cristo!!!\n\n";
		exit;
	}
}
elsif($ARGC==2){
	if($ARGV[0]eq"-n"){
		$numero_parole=$ARGV[1];
	}
	else{
		print"\nriprova dio cane ma sta tento dio troia merda del cristo!!!\n\n";
		exit;
	}
}

open(FILE_1,parole_random);
open(FILE_OUT, ">>nomi_random");

@parole=<FILE_1>;
$taglia_parole=@parole;

while($numero_parole>0){
	$indice_parola=int(rand($taglia_parole));
	$parola=$parole[$indice_parola];
	chomp($parola);
	$titolo.=" ".$parola;
	$numero_parole--;
}

print "\nIl titolo per il cd di natale dei Milingus è \n";
print "\n\t$titolo\n\n";
print FILE_OUT $titolo,"\n";

sub print_help{
	print("\n\tMALANG_HELP\n");
	print"* con -h printa questo aiuto\n";
	print"* se scrivi -n e un numero, selezioni di quante parole deve essere composto il titolo\n";
	print"* modalità random con -r\n";
	print"* qualsiasi altra operazione rompe tuto e bestemmia\n\n";
	exit;
}
