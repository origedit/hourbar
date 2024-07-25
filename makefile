name:=hourbar
source:=$(name).tal
rom:=$(name).rom

run: $(rom)
	uxnemu $(rom)

$(rom): $(source)
	make format
	make lint
	drifblim $(source) $@
	rm *.sym

format: $(source)
	uxnfor $(source)

validate: $(source)
	uxnbal $(source)

lint: $(source)
	uxnlin $(source)

left:
	(left $(source) &)

