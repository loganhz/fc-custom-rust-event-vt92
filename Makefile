build-img:
	docker build -t fc-rust-env -f Dockerfile.build .

build: build-img
	docker run --rm -it -v $$(pwd):/opt/rust-demo fc-rust-env bash -c "cd /opt/rust-demo/bootstrap && /root/.cargo/bin/cargo build"
	mkdir -p pkg
	cp bootstrap/target/debug/bootstrap pkg/

deploy: build
	s deploy -y