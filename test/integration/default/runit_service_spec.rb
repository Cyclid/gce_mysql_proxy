describe package('runit') do
  it { should be_installed }
end

# Can't use the service matcher for Runit services
describe command('sv status cloud_sql_proxy') do
  its('stdout') do
    should match %r{\Adown: cloud_sql_proxy: .s, normally up, want up; run: log:.*\Z}
  end
end
