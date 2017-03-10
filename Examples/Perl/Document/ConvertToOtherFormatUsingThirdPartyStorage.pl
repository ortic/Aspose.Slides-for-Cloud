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
my $filename = "sample";
my $name = $filename . ".pptx";
my $format = "tiff";
my $storage = 'AsposeDropboxStorage';

# Upload file to 3rd party cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name, storage=>$storage);

# Invoke Aspose.Slides Cloud SDK API to save a presentation to different other formats         
$response = $slidesApi->GetSlidesDocumentWithFormat(name => $name, format => $format, storage=>$storage);

if($response->{'Status'} eq 'OK'){
	# Save converted format file from response 
	my $output_file = $out_path. $filename . '.' . $format;	
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1