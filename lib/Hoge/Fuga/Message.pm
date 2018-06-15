package Hoge::Fuga::Message;

use strict;
use warnings;
use MIME::Base64 qw();
use Google::ProtocolBuffers::Dynamic;

my $gpd = Google::ProtocolBuffers::Dynamic->new;

$gpd->load_serialized_string(MIME::Base64::decode_base64(<<'EOD'));
CmEKE3Byb3RvL21lc3NhZ2UucHJvdG8iQgoGUGVyc29uEhIKBG5hbWUYASABKAlSBG5hbWUSDgoC
aWQYAiABKAVSAmlkEhQKBWVtYWlsGAMgASgJUgVlbWFpbGIGcHJvdG8z

EOD


$gpd->map(
    {
      'package' => '',
      'prefix' => 'Hoge::Fuga::Message'
    },
);

undef $gpd;

1;
