require 'spec_helper'

describe 'file_line_match' do
  let(:msg_missing) { 'expected one match attribute for file_line resource' }
  let(:msg_wrong) { 'match attribute for file_line doesn\'t match line' }

  context 'with fix disabled' do
    context 'code with missing match attribute' do
      let(:code) { "
      file { '/tmp/foo':
        ensure => present,
        foo => bar,
        baz => gronk,
        foo => meh,
      }
      file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => '%sudo ALL=(ALL) ALL',
      }" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg_missing).on_line(8).in_column(31)
      end
    end
    context 'code with duplicate match attribute' do
      let(:code) { "
      file_line { 'sudo_rule':
        path => '/etc/sudoers',
        match  => '^export\\ HTTP_PROXY\\=',
        line => '%sudo ALL=(ALL) ALL',
        match  => '^export\\ HTTP_PROXY\\=',
      }" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg_missing).on_line(2).in_column(31)
      end
    end
    context 'code with unmatching attribute' do
      let(:code) { "
      file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => '%sudo ALL=(ALL) ALL',
        match  => '^sodu',
      }" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg_wrong).on_line(2).in_column(31)
      end
    end

    context 'code with a match attribute' do
      let(:code) { "
      file_line { 'bashrc_proxy':
        ensure => present,
        path   => '/etc/bashrc',
        line   => 'export HTTP_PROXY=http://squid.puppetlabs.vm:3128',
        match  => '^export\\ HTTP_PROXY\\=',
      }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
  end
end