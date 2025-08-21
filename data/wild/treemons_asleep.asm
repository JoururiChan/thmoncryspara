; Used by CheckSleepingTreeMon

AsleepTreeMons:
	table_width 1
	dr .Morn
	dr .Day
	dr .Nite
	dr .Eve
	assert_table_length NUM_DAYTIMES
.Nite
.Eve
	dp CWRIGGLE
	dp CMYSTIA
	dp CSUIKA
	dp CYAMAME
	dp CPATCHOULI
	dp CMEDICINE
	dp CKEINE
	dp CKAGUYA
	dp CMOKOU
	dp CYUKA
	db 0 ; end

.Morn
.Day
	dp CDAICHAN
	dp CMEILING
	dp CORANGE
	dp CYUKA
	dp CYUKARI
	db 0 ; end
