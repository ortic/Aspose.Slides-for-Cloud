#ExStart:1
use lib 'lib';
use strict;
use warnings;
use utf8;
use File::Slurp; # From CPAN
use JSON;

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

# Instantiate Aspose.Slide API SDK
my $slidesApi = AsposeSlidesCloud::SlidesApi->new();

# Set input file name
my $filename = "sample";
my $name = $filename . ".pptx";
my $format = "pdf";

# Invoke Aspose.Slides Cloud SDK API to save a presentation to different other formats using input stream         
my $response = $slidesApi->PutSlidesConvert(file => $data_path.$name, format => $format);

if($response->{'Status'} eq 'OK'){
	#save converted format file from response 
	my $output_file = $out_path. $filename . '.' . $format;	
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1