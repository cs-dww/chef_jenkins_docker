docker_service 'default' do
        action [:create, :start]
end

#pull latest nginx image
docker_image 'nginx' do
     tag 'latest'
     action :pull
end

#Run container mapping container port 80 to host port 80
docker_container 'chef_nginx' do
        repo 'nginx'
        tag 'latest'
        port '80:80'
end

#https://github.com/vaadin/addressbook

#copy a Dockerfile to buid
cookbook_file '/tmp/Dockerfile' do
  source 'Dockerfile'
#  mode "0644"
  action :create
end

#build image
# /tmp/Dockerfile is location on c
docker_image 'dww/addressbook' do
  tag 'v1'
  source '/tmp/Dockerfile'
  action :build
end

#push to dockerhub
#docker-image 'sai/addressbook' do
#  action :push
#end
#
#Run the container
docker_container 'addressbook' do
  repo 'dww/addressbook'
  tag 'v1'
  port '8888:8080'
end

