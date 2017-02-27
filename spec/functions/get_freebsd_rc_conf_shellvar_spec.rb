describe 'get_freebsd_rc_conf_shellvar' do
  context 'setting only the mtu' do
    hash = {
      'ifconfig_re0' => {
        'value' => 'mtu 9000'
      }
    }

    c = {
      'name' => 're0',
      'mtu'  => 9000
    }
    it { is_expected.to run.with_params(c).and_return(hash) }
  end

  context 'a full example' do
    hash = {
      'ifconfig_re0' => {
        'value' => 'inet 10.0.1.12/24 mtu 9000'
      },
      'ifconfig_re0_alias0' => {
        'value' => 'inet 10.0.1.13/24'
      },
      'ifconfig_re0_alias1' => {
        'value' => 'inet 10.0.1.14/24'
      }
    }

    full = {
      'name'        => 're0',
      'description' => 'Uplink',
      'addresses' => [
        '10.0.1.12/24',
        '10.0.1.13/24',
        '10.0.1.14/24'
      ],
      'options' => [
        'mtu 9000'
      ]
    }

    it { is_expected.to run.with_params(full).and_return(hash) }
  end
end
