describe file('/usr/local/bin/cloud_sql_proxy') do
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/cloudsql') do
  it { should be_directory }
end
