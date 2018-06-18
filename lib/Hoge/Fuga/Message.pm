package Hoge::Fuga::Message;

use strict;
use warnings;
use MIME::Base64 qw();
use Google::ProtocolBuffers::Dynamic;

my $gpd = Google::ProtocolBuffers::Dynamic->new;

$gpd->load_serialized_string(MIME::Base64::decode_base64(<<'EOD'));
CmYKE3Byb3RvL21lc3NhZ2UucHJvdG8SBXVzZXJzIkAKBFVzZXISEgoEbmFtZRgBIAEoCVIEbmFt
ZRIOCgJpZBgCIAEoBVICaWQSFAoFZW1haWwYAyABKAlSBWVtYWlsYgZwcm90bzM=

EOD


$gpd->map(
    {
      'package' => 'users',
      'prefix' => 'Hoge::Fuga::Message::Users'
    },
);

undef $gpd;

1;
