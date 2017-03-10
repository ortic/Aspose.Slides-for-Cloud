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

# Instantiate Aspose.Storage and Aspose.Slides API SDK
my $storageApi = AsposeStorageCloud::StorageApi->new();
my $slidesApi = AsposeSlidesCloud::SlidesApi->new();

# Set input file name
my $name = 'sample-input.pptx';
my $from = 2;
my $to = 3;
my $format = 'png';
	
# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.Slides Cloud SDK API to split all or specific slides of a presentation file to specify format         
$response = $slidesApi->PostSlidesSplit(name => $name, from=>$from, to=>$to, format=>$format);

if($response->{'Status'} eq 'OK'){
	foreach my $splitDoc (@{$response->{'SplitResult'}->{'Slides'}}){
		my $urlString = $splitDoc->{'Href'};
		my ($file) = $urlString =~ m|^.*/(.*)$|;
		print "\n File :: $file";
		my $output_file = $out_path. $file;
		$response = $storageApi->GetDownload(Path => $file);;
		write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
	}	
}
#ExEnd:1