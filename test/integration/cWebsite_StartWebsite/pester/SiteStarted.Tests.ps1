describe 'When using the cWebAdministration resources' {
  context 'to start the default website' {

    it 'verifies IIS is installed' {
      (Get-WindowsFeature web-server).installed | should be $true
    }

    it 'installs a default website' {
      Get-Website 'Default Web Site' | should not be $null
    }

    it 'sets the default site to started' {
      (Get-Website 'Default Web Site').State | should be 'Started'
    }

    it 'should have a default index.html' {
      irm localhost | should match 'hi'
    }
  }

}