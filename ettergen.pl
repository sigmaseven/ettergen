#!/usr/bin/perl

use Modules::Rule;

$rule = new Rule();
$rule2 = new Rule();

$rule->setTemplate("Templates/template");
$rule->setMatch("one");
$rule->setReplace("two");

$rule2->setTemplate("Templates/template");
$rule2->setMatch("three");
$rule2->setReplace("four");

open(FILE, ">filter");
my $data  .= $rule->generate();
$data .= $rule2->generate();

print FILE $data;
close(FILE);

my $output = `etterfilter filter`;
print $output;
