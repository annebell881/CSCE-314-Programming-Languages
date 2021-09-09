import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class GameMechanics{
	
	static boolean BattleTester(ArrayList<?> list){
		boolean isHero = false;
		int armor;
		Object x = list.get(0);
		if( x instanceof Hero){
			isHero = true;
		}
		else{
			isHero = false;
		}
		return isHero;
	}
	
	static void basicWinChances(Character a, Charater b){
		if(a instanceof Hero && b instanceof Hero){
			System.out.println("Heros cant fight Heros");
		}
		else if (a instanceof Villain && b instanceof Villain){
			System.out.println("Heros cant fight Heros");
		}
		else{
			if(a.getHearts() > b.getHearts()){
				
				System.out.println("Winner : " + a.name);
				System.out.println("Ratio : " + a.getHearts + "to " + b.getHearts);
			}
			else{
				System.out.println("Winner : " + b.name);
				System.out.println("Ratio : " + a.getHearts + "to " + b.getHearts);
			}
		}
	}
}