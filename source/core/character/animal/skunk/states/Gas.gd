extends State

func enter(host):
	host.gas()
	host.gas_timer.start()
	host.change_state("idle")

func exit():
	pass