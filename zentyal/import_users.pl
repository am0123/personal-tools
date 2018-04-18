use strict;
use warnings;
use EBox;
use EBox::Users::User;

my $filename='users_final.csv';
open(my $file, '<:encoding(UTF-8)', $filename) or die "Could not open file \n ";

EBox::init();
my $parent = EBox::Users::User->defaultContainer(1);


while (my $row = <$file>){
	chomp $row;
	my ($uidNumber,$givenname,$surname,$fullname,$uid,$password)=split/,/,$row;
	print "$uidNumber\n";
	EBox::Users::User->create(
	uid => $uid,
	password => $password,
	uidNumber => $uidNumber,
	fullname => $fullname,
	givenname => $givenname,
	surname   => $surname,
	description => '',
	mail => '',
	parent => $parent);
}
