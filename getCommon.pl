#!usr/bin/perl

if(@ARGV<2){
  die "USAGE = <File 1> <column in file 1 to compare (column starting with 1)> <File 2> <column in file 2 to compare (column starting with 1)> <delimiter>\n OR \nUSAGE=<File 1 with list of elements> <File 2 with list of elements>\n";}


if(@ARGV>2){
$file1=shift;
$col1=shift;
$file2=shift;
$col2=shift;
$del=shift;
}
else{
$file1=shift;
$file2=shift;
$col1=1;
$col2=1;
$del=" ";
}

open(DAT,"$file1");
%hash=();
$v=$col1-1;
$v1=$col2-1;
while($in=<DAT>)
{
  chomp($in);
  @a=split("$del",$in);
 if(@a>1){$hash{$a[$v]}=$in;}
  else{$hash{$in}=$in;}
}
close(DAT);

open(DAT,"$file2");
while($in=<DAT>)
{
  chomp($in);
  @a=split("$del",$in);
  if(@a>1){$x=$a[$v1];}
  else{$x=$in;}
  if(exists $hash{$x})
  {
    print "$hash{$x}\t||\t$in\n";
  }
}
close(DAT);


