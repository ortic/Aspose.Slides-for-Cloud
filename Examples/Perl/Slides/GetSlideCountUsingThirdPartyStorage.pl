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
my $slideIndex = 1;
my $storage = 'AsposeDropboxStorage';

# Upload file to 3rd party cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name, storage=>$storage);

# Invoke Aspose.Slides Cloud SDK API to get PowerPoint document slide list                                   
$response = $slidesApi->GetSlidesSlidesList(name => $name, slideIndex=>$slideIndex, storage=>$storage);

if($response->{'Status'} eq 'OK'){
	print "\n Total Slides :: ". scalar(@{$response->{'Slides'}->{'SlideList'}});
}
#ExEnd:1