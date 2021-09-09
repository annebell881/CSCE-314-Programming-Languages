class SubsetOutputFib {
	
	static final int MAX_INDEX = 9;
	
	//calculate the fib sequence up to n
	public static int[] feb(int n){
		int fn[]= new int[n+1];
		//the first two ints of every fib
		fn[0] = 0;
		fn[1] = 1;
		//calculate the sequence
		for (int i = 2; i <= n; i++){
			fn[i] = fn[i-1] + fn[i-2];
		}
		return fn;
	}


	//create a main to test the sequence

	public static void main(String []args){
		//we want to take in the inputs of the user to create a run
		int be = Integer.parseInt(args[0]);
		int en = Integer.parseInt(args[1]);
		// check if the begining is less than the end
		//we also dont want them to be negitive or the sequence does not work
		if(be < 0 || en < 0|| be >= en){
			//tell the user invalid inputs
			System.out.println("Input is invalid");
		}
		// we need to do the sequence, call the function to create an array of the sequences
		int fbe[] = feb(en);
		boolean first = true;
		for (int i = be; i <= en; i++){
			if(first && fbe[i] %2 == 0){
				System.out.println(i+": "+fbe[i]+ "*");
				//above puts a star with the first number of the sequence
				first = false;
			}
			else{
				System.out.println(i+": "+fbe[i]);
			}
		}
	}
}

class ImprovedFibonacci {
	//change println to printf
	static final int MAX_INDEX = 9;
	
	public static void main(String[] args){
		int lo = 1;
		int hi = 1;
		String mark;
		
		System.out.printf("1: %d%n",lo);
		for (int i = 2; i <= MAX_INDEX; i++){
			if(hi % 2 == 0){
				mark = " *";
			}
			else{
				mark = " ";
			}
			System.out.printf("%d: %d%s \n",i,hi,mark);
			hi = lo + hi;
			lo = hi - lo;
		}
	}
}
	