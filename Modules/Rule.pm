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
		proto => undef,
		regex => undef		
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
	my $self = shift;
	$self->{srcport} = $_[0];
}

sub getSourcePort()
{
	my $self = shift;
	return $self->{srcport};
}

sub setDestinationPort()
{
	my $self = shift;
	$self->{dstport} = $_[0];
}

sub getDestinationPort()
{
	my $self = shift;
	return $self->{dstport};
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
	my $self = shift;
	$self->{proto} = $_[0];
}

sub getProto()
{
	my $self = shift;
	return $self->{proto};
}

sub setRegex()
{
	my $self = shift;
	$self->{regex} = $_[0];
}

sub getRegex()
{
	my $self = shift;
	return $self->{regex};
}

sub generate()
{
	my $self = shift;
	my $template = $self->getTemplate();
	my $match = $self->getMatch();
	my $replace = $self->getReplace();
	my $source = $self->getSource();
	my $dest = $self->getDestination();
	my $dstport = $self->getDestinationPort();
	my $srcport = $self->getSourcePort();

	my @source; # array to stuff modified source code
	my $data = ''; # reassembled source string to be returned

	open(TEMPLATE, $template) || die "Template file could not be opened: $!\n";
	while(<TEMPLATE>)
	{
		$_ =~ s/%match%/$match/ig;
		$_ =~ s/%replace%/$replace/ig;
		$_ =~ s/%src%/$source/ig;
		$_ =~ s/%dst%/$dest/ig;
		$_ =~ s/%srcport%/$srcport/ig;
		$_ =~ s/%dstport%/$dstport/ig;

		push(@source, $_);
	}
	close(TEMPLATE);

	foreach(@source)
	{
		$data .= $_;
	}
	return($data);
} # end of generate()

return(1);
