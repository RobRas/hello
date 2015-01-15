APP=hello
APP_XML=$(APP).xml
ADL=$(FLEX)/bin/adl
AMXMLC=$(FLEX)/bin/amxmlc
SOURCES=src/Startup.hx
all: $(APP).swf
$(APP).swf $(SOURCES)
	haxe \
	-cp src \
	-cp vendor \
	-swf-version 11.8 \
	-swf-header 1280:720:60:ffffff \
	-main Startup \
	-swf $(APP).swf \
	-swf-lib vendor/starling.swc --macro "patchTypes('vendor/starling.patch')"

clean:
	del $(APP).swf
	
test: $(APP).swf
	$(ADL) -profile tv -screensize 1280x720:1280x720 $(APP_XML)