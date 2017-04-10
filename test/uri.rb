assert("URI") do
  uri = URI.parse("http://user:password@domain.tld:8080/path?query=string#fragment")
  encoded = URI.encode(uri.to_s)
  assert_equal(uri.to_s, URI.decode(encoded))
  assert_equal('http', uri.schema)
  assert_equal('http', uri.scheme)
  assert_equal('user:password', uri.userinfo)
  assert_equal('domain.tld', uri.host)
  assert_equal(8080, uri.port)
  assert_equal('/path', uri.path)
  assert_equal('query=string', uri.query)
  assert_equal('fragment', uri.fragment)
  assert_equal("http://user:password@domain.tld:8080/path?query=string#fragment", uri.to_s)

  uri = URI.parse('https://heise.de')
  assert_equal('https', uri.scheme)
  assert_equal('heise.de', uri.host)
  assert_equal(443, uri.port)
  assert_equal('https://heise.de', uri.to_s)

  #HTTP CONNECT parsing
  uri = URI.parse("heise.de:443", true)
  assert_equal('heise.de', uri.host)
  assert_equal(443, uri.port)
end
