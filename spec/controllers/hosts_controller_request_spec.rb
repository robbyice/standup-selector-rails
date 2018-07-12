require 'rails_helper'

RSpec.describe 'HostsController', type: :request do
  describe 'Host CRUD' do
    describe 'POST /hosts' do
      it 'returns a 200 when successfully creating a host' do
        new_host_body = {
            first_name: 'First',
            last_name: 'Last'
        }

        post hosts_path, params: new_host_body

        expect(response.status).to eq(200)
      end

      describe 'validation' do
        it 'returns a 400 when any required parameters are missing' do
          puts "i be gettin here yo1"
          post hosts_path, params: {first_name: 'no last name!'}

          expect(response.status).to eq(400)
        end
      end
    end
    it 'GET /hosts returns all hosts' do
      get hosts_path

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([])

      host1 = Host.create(first_name: 'foo1', last_name: 'bar1')
      host2 = Host.create(first_name: 'foo2', last_name: 'bar2')

      get hosts_path

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to indiff_array_match([
          {
              id: host1.id,
              first_name: 'foo1',
              last_name: 'bar1'
          },
          {
              id: host2.id,
              first_name: 'foo2',
              last_name: 'bar2'
          }])
    end
  end
end