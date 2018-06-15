use strict;
use warnings;
use Test::More;

use_ok 'Hoge::Fuga::Message';

subtest Person => sub {

    subtest 'encode/decode' => sub {
        my $p1 = Hoge::Fuga::Message::Person->new;
        $p1->set_id(123);
        $p1->set_name('hoge fuga');
        $p1->set_email('hoge@foo.bar');
        my $bytes = Hoge::Fuga::Message::Person->encode($p1);
        my $p2 = Hoge::Fuga::Message::Person->decode($bytes);

        is $p2->get_id, 123;
        is $p2->get_name, 'hoge fuga';
        is $p2->get_email, 'hoge@foo.bar';
    };
};

done_testing;
