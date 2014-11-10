require 'spec_helper'

describe 'prefs' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "prefs class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('prefs::params') }
        it { should contain_class('prefs::install').that_comes_before('prefs::config') }
        it { should contain_class('prefs::config') }
        it { should contain_class('prefs::service').that_subscribes_to('prefs::config') }

        it { should contain_service('prefs') }
        it { should contain_package('prefs').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'prefs class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('prefs') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
