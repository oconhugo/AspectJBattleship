package ext;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;

import battleship.model.*;

abstract class Strategy {
	
	public HashMap<Integer,Place> allMoves;
	
	/*
	 * Create hashmap with all possible board moves
	 */
	public void setAllMoves(Iterable<Place> places){
		allMoves = new HashMap<Integer,Place>();
		int boardIndex = 1;
		for(Place place : places){
			allMoves.put(boardIndex, place);
			boardIndex++;
		}
	}
	/* 
	 * Generates computer opponent move
	 * To be overriden in strategy classes.
	 */
	void move(){}
	
	/*
	 * Method used to delete a movement that will no longer be used in game
	 */
	public void removeMovement(int positionNumber){
		allMoves.remove(positionNumber);
	}

	/*
	 * Instantiate strategy to be used
	 * 
	 */
	public Strategy(Iterable<Place> places){
		setAllMoves(places);
		
	}
	
	
	//////////////////////////////////////////////////////////////////////////

	
	public class SmartStrategy extends Strategy  {
		Stack<Integer> nextAIShots;
		boolean shipHit = false;
		
		public SmartStrategy(Iterable<Place> places){
			super(places);
			setAllMoves(places);
			nextAIShots = new Stack<Integer>();
		}
		@Override
		void move(){
			
		
		}
	}
	
	public class SweepStrategy extends Strategy{
		
		public SweepStrategy(Iterable<Place> places){
			super(places);
		}
		@Override
		void move(){
			
		}
	}
	
	public class RandomStrategy extends Strategy{
		public RandomStrategy(Iterable<Place> places){
			super(places);
		}
		@Override
		void move(){
		}
	}
}
	
	
	


