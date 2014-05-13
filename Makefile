UI_PATH=.
UI_SOURCES=$(wildcard $(UI_PATH)/*.ui)
UI_FILES=$(patsubst $(UI_PATH)/%.ui, $(UI_PATH)/ui_%.py, $(UI_SOURCES))

$(UI_FILES): $(UI_PATH)/ui_%.py: $(UI_PATH)/%.ui
	pyuic4 -o $@ $<

clean:
	rm -f $(ALL_FILES)
	rm -f *.pyc
	rm -f *.zip

package:
	cd .. && rm -f *.zip && zip -r clickfu.zip clickfu -x \*.pyc \*.ts \*.ui \*.qrc \*.pro \*~ \*.git\* \*.svn\* \*Makefile*
	mv ../clickfu.zip .

upload:
	plugin_uploader_NG.py clickfu.zip
