/**
 * Allocate a new lottery thread queue.
 */
public ThreadQueue newThreadQueue(boolean transferPriority) {
	return new LotteryQueue(transferPriority);
}

protected class LotteryQueue extends ThreadQueue{
	public boolean transP;
	private LinkedList<KThread> waitingUser;

	public LotteryQueue(boolean transP){
		this.transP = transP;
		waitingUser = new LinkedList<KThread>();
	}

	public void acquire(KThread thread) {
		Lib.assertTrue(Machine.interrupt().disabled());
		getThreadState(thread).acquire(this);
	}

	public KThread nextThread() {
		Lib.assertTrue(Machine.interrupt().disabled());
		if(waitingUser.size() < 1){
			return null;
		}else{
			int totalTickets;
			if(transP){
				totalTickets = getTotalEffectiveTickets();
			}else{
				totalTickets = getSumCard();
			}

			int lotteryNumber = new Random().nextInt(totalTickets);
			Collections.sort(waitingUser, new Comparator<KThread>(){
			});

		}

		return null;
	}

	}
}