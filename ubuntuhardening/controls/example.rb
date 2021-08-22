# copyright: 2018, The Authors

title "sample section"

# # you can also use plain tests
# describe file("/tmp") do
#   it { should be_directory }
# end

# # you add controls here
# control "tmp-1.0" do                        # A unique ID for this control
#   impact 0.7                                # The criticality, if this control fails.
#   title "Create /tmp directory"             # A human-readable title
#   desc "An optional description..."
#   describe file("/tmp") do                  # The actual test
#     it { should be_directory }
#   end
# end



# describe file('/etc/shadow') do
#   it { should exist }
# end

control "Control 1" do
  impact 1
  title "Check the Shadow file exists or not"
  desc "This piece of code will check weather a shadow file is there or not"
  describe file('/etc/shadow') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'nishanth' }
  end
end

control "Control 2" do
  impact 0.5
  title "Check Login Banner is available or not"
  desc "Login Banner is important as a Part of Compliance requirements ISO 27001 Control xxx"
  describe file("banner.txt") do
    its('content') { should match "Welcome to Vodafone" }
  end
end


control "Control 3" do
  impact 0.5
  title "Postgresql should be installed"
  desc "In Our Project, we use Postgresql Server for storing data"
  describe service('postgresql') do
    it { should be_enabled }
  end
end

control "Control 4" do
  impact 0.5
  title "ClamAV Should be Installed"
  desc "ClamAV should be avaialble in all linux servers as per ISO 27001 document IT Management Policy"
  describe service('clamd') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end

control "Control 5" do
  impact 0.5
  title "ClamAV Package"
  desc "ClamAV Package is installed or not "
  describe package('clamav') do
    it { should be_installed }
    its('version') { should eq '1.1.1' }
  end
end