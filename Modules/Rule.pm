package Rule;

sub new
{
	my $self = 
	{
		filename => undef,
		template => undef,
		src => undef,
		dst => undef,
		srcport => undef,
		dstport => undef,
		match => undef,
		replace => undef,
		proto => undef		
	};

	bless($self);
	return($self);
}

sub setFile()
{
	my $self = shift;
	$self->{filename} = $_[0];
}

sub getFile()
{
	my $self = shift;
	return $self->{filename};
}

sub setTemplate()
{
	my $self = shift;
	$self->{template} = $_[0];
}

sub getTemplate()
{
	my $self = shift;
	return $self->{template};
}

sub setSource()
{
	my $self = shift;
	$self->{src} = $_[0];
}

sub getSource()
{
	my $self = shift;
	return self->{src};
}

sub setDestination()
{
	my $self = shift;
	$self->{dst} = $_[0];
}

sub getDestination()
{
	my $self = shift;
	return $self->{dst};
}

sub setSourcePort()
{
}

sub getSourcePort()
{
}

sub setMatch()
{
	my $self = shift;
	$self->{match} = $_[0];
}

sub getMatch()
{
	my $self = shift;
	return $self->{match};
}

sub setReplace()
{
	my $self = shift;
	$self->{replace} = $_[0];
}

sub getReplace()
{
	my $self = shift;
	return $self->{replace};
}

sub setProto()
{
}

sub getProto()
{
}

sub generate()
{
	my $self = shift;
	my $template = $self->getTemplate();
	my $match = $self->getMatch();
	my $replace = $self->getReplace();
	my $sourcefile = $self->getSource();
	my @source; # array to stuff modified source code
	my $data = ''; # reassembled source string to be returned

	open(TEMPLATE, $template) || die "Template file could not be opened: $!\n";
	while(<TEMPLATE>)
	{
		$_ =~ s/%match%/$match/ig;
		$_ =~ s/%replace%/$replace/ig;
		push(@source, $_);
	}
	close(TEMPLATE);

	foreach(@source)
	{
		$data .= $_;
	}
	return($data);
}

return(1);
