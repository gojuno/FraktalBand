#!/usr/bin/env bash
SOURCERY_PATH=./thirdparty/sourcery/bin/sourcery
TEMPLATES_PATH=./Scripts/fraktal_templates

$SOURCERY_PATH \
	--sources FraktalBand \
	--templates $TEMPLATES_PATH/AutoPresentable.swifttemplate \
	--templates $TEMPLATES_PATH/AutoPresenters.swifttemplate \
	--templates $TEMPLATES_PATH/AutoMockPresentable.swifttemplate \
	--output FraktalBandUI/Generated \
	--args import=ReactiveSwift

$SOURCERY_PATH \
	--sources FraktalBand \
	--templates $TEMPLATES_PATH/AutoTestView.swifttemplate \
	--output FraktalBandTests/Generated \
	--args import=ReactiveSwift,import=FraktalBandUI,testableImport=FraktalBand