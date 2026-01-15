# DEV tools
function minstall
	./mvnw install
end

# AIV specific
function awstools
	docker run --rm -ti -v ~/.aws:/root/.aws mbp/aws
end


# PHP tools

function hash
	php /home/schophil/systemconfig/tools/public/hash.php $argv
end

function rrngen
	php /home/schophil/systemconfig/tools/public/generate_rrn.php $argv
end

function base64decode
	php /home/schophil/systemconfig/tools/public/base64decode.php $argv
end

function base64encode
	php /home/schophil/systemconfig/tools/public/base64encode.php $argv
end

function unhashrrn
	php /home/schophil/systemconfig/tools/public/unhash_rrn.php $argv
end
