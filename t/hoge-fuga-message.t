use strict;
use warnings;
use Data::Dumper;
use Test::More;

use_ok 'Hoge::Fuga::Message';

subtest Users => sub {

    subtest User => sub {

        subtest 'encode/decode' => sub {
            my $p1 = Hoge::Fuga::Message::Users::User->new;
            $p1->set_id(123);
            $p1->set_name('hoge fuga');
            $p1->set_email_list([qw( hoge@foo.bar fuga@foo.bar )]);
            $p1->add_email('hogefuga@foo.bar');
            $p1->set_idmap_map({
                hogefuga => 'hogefuga!',
            });
            $p1->set_idmap(hoge => 'hoge!');
            $p1->set_idmap(fuga => 'fuga?');

            my $bytes = Hoge::Fuga::Message::Users::User->encode($p1);
            my $p2 = Hoge::Fuga::Message::Users::User->decode($bytes);

            is $p2->get_id, 123;
            is $p2->get_name, 'hoge fuga';
            is $p2->email_size, 3;
            is_deeply $p2->get_email_list, [qw( hoge@foo.bar fuga@foo.bar hogefuga@foo.bar )];
            is $p2->get_idmap('hoge'), 'hoge!';
            is $p2->get_idmap('fuga'), 'fuga?';
            is_deeply $p2->get_idmap_map, {
                hoge => 'hoge!',
                fuga => 'fuga?',
                hogefuga => 'hogefuga!',
            };
        };
    };
};

done_testing;
