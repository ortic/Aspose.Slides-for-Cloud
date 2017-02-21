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

# Instantiate Aspose.Slides API SDK
my $slidesApi = AsposeSlidesCloud::SlidesApi->new();
my $storageApi = AsposeStorageCloud::StorageApi->new();

# Set input file name
my $name = 'sample_';
for (0..7) { $name .= chr( int(rand(25) + 65) ); }
$name .= '.pptx';
my $templatePath = 'sample.pptx';

# Invoke Aspose.Slides Cloud SDK API to create a new empty presentation         
my $response = $slidesApi->PutNewPresentation(name => $name, file => $data_path.$templatePath);

if($response->{'Status'} eq 'Created'){
	# Download presentation from cloud storage
	my $output_file = $out_path. $name;
	$response = $storageApi->GetDownload(Path => $name);;
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1