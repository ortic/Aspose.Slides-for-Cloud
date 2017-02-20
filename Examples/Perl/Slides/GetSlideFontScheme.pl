#ExStart:1
use lib 'lib';
use strict;
use warnings;
use utf8;
use File::Slurp; # From CPAN
use JSON;

use AsposeStorageCloud::StorageApi;
use AsposeStorageCloud::ApiClient;
use AsposeStorageCloud::Configuration;

use AsposeSlidesCloud::SlidesApi;
use AsposeSlidesCloud::ApiClient;
use AsposeSlidesCloud::Configuration;

my $configFile = '../Config/config.json';
my $configPropsText = read_file($configFile);
my $configProps = decode_json($configPropsText);
my $data_path = '../../../Data/';
my $out_path = $configProps->{'out_folder'};

$AsposeSlidesCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeSlidesCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeSlidesCloud::Configuration::debug = 1;

$AsposeStorageCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeStorageCloud::Configuration::api_key = $configProps->{'api_key'};

# Instantiate Aspose.Storage and Aspose.Pdf API SDK
my $storageApi = AsposeStorageCloud::StorageApi->new();
my $slidesApi = AsposeSlidesCloud::SlidesApi->new();

# Set input file name
my $name = 'sample-input.pptx';
my $slideIndex = 1;

# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.Slides Cloud SDK API to get font scheme of a particular slide                               
$response = $slidesApi->GetSlidesThemeFontScheme(name => $name, slideIndex=>$slideIndex);

if($response->{'Status'} eq 'OK'){
	my $fontScheme = $response->{'FontScheme'};
	print "\nName : " .  $fontScheme->{'Name'};
	print "\nComplexScript (heading part) : " .  $fontScheme->{'Major'}->{'ComplexScript'};
	print "\nEastAsian (heading part) : " .  $fontScheme->{'Major'}->{'EastAsian'};
	print "\nLatin (heading part) : " .  $fontScheme->{'Major'}->{'Latin'};
	print "\nEastAsian (body part) : " .  $fontScheme->{'Minor'}->{'EastAsian'};
	print "\nLatin (body part) : " .  $fontScheme->{'Minor'}->{'Latin'};	
}
#ExEnd:1