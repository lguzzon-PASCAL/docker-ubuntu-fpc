FROM ubuntu:latest

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install make binutils build-essential subversion zip unzip wget && \
	cd /tmp && \
	mkdir fpcSetup && \
	cd fpcSetup && \
	wget https://github.com/LongDirtyAnimAlf/Reiniero-fpcup/releases/download/1.6.0n/fpcup-$(uname -m)-linux && \
	chmod +x fpcup-$(uname -m)-linux && \
	./fpcup-$(uname -m)-linux --noconfirm --fpcURL="3.1.1" --fpcOPT="-O4" --crossOPT="-O4" clean && \
	./fpcup-$(uname -m)-linux --noconfirm --fpcURL="3.1.1" --fpcOPT="-O4" --crossOPT="-O4" --cputarget=i386 --ostarget=win32 --only="FPCCleanOnly,FPCBuildOnly" && \
	./fpcup-$(uname -m)-linux --noconfirm --fpcURL="3.1.1" --fpcOPT="-O4" --crossOPT="-O4" --cputarget=x86_64 --ostarget=win64 --only="FPCCleanOnly,FPCBuildOnly" && \
	cd  / && \
	rm -rf /tmp/fpcSetup
