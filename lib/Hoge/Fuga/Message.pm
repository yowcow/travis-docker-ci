package Hoge::Fuga::Message;

use strict;
use warnings;
use MIME::Base64 qw();
use Google::ProtocolBuffers::Dynamic;

my $gpd = Google::ProtocolBuffers::Dynamic->new;

$gpd->load_serialized_string(MIME::Base64::decode_base64(<<'EOD'));
Cr0BChNwcm90by9tZXNzYWdlLnByb3RvEgV1c2VycyKeAQoEVXNlchISCgRuYW1lGAEgAigJUgRu
YW1lEg4KAmlkGAIgAigFUgJpZBIUCgVlbWFpbBgDIAMoCVIFZW1haWwSKQoFaWRtYXAYBCADKAsy
Ey51c2Vycy5Vc2VyLktWRW50cnlSBWlkbWFwGjEKB0tWRW50cnkSEAoDa2V5GAEgASgJUgNrZXkS
FAoFdmFsdWUYAiABKAlSBXZhbHVl

EOD


$gpd->map(
    {
      'options' => {
                     'implicit_maps' => 1
                   },
      'package' => 'users',
      'prefix' => 'Hoge::Fuga::Message::Users'
    },
);

undef $gpd;

1;
