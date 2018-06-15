requires 'Google::ProtocolBuffers::Dynamic';
requires 'Grpc::XS';

on 'test' => sub {
    requires 'Test::More', '>= 0.98';
};
