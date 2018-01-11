public final static String e = "2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952";
  
public ArrayList <Integer> nums = new ArrayList <Integer>();
int mode = 1; // mode = 1 calculates part 1, mode = 2 calculates part 2
int count = 0;   
int begin = 2;
int end = 12;
int index = 2;
String group = e.substring(begin,end);
double eGroup = Double.parseDouble(group);
String bunch = e.substring(index,index + 1);
int eBunch = Integer.parseInt(bunch);

public void setup()  
{       
	size(300,300);
	background(0);
	noLoop();
}  
public void draw()  
{   
	ellipse(75,150,50,50);
	ellipse(225,150,50,50);
	calc(mode);
}  
public boolean isPrime(double dNum)  
{   
    for(int i = 2; i <= Math.sqrt(dNum);i++){
    	if(dNum % i == 0){
      		return false;
    	}
  	}
  	return true;
} 

public boolean is49 (ArrayList <Integer> dNum){
	int sum = 0;
	for(int temp : dNum){
		sum = sum + temp;
	}
	if(sum == 49){
		return true;
	}
	return false;
}
//part 2 sum of 49

public void remove(){
	for(int i = nums.size() - 1; i >= 0; i --){
		nums.remove(i);
	}
}

public void calc(int type){
	for(int i = 0; i < e.length() - 11; i ++){
		if(type == 1){
	    	group = e.substring(begin,end);
	    	eGroup = Double.parseDouble(group);
	    	if(isPrime(eGroup) == true){
	    		System.out.println(eGroup);
	    		return;
	    	}
	    	begin ++;
	    	end ++;
		}
		else if(type == 2){
	    	for(int j = 0; j < 10; j ++){
				bunch = e.substring(index + j,index + 1 + j);
				eBunch = Integer.parseInt(bunch);
				nums.add(eBunch);
			}
			if(is49(nums) == true){
				if(count == 4){
					

					for(int k = 0;k < nums.size() - 1 ; k++){
						System.out.print(nums.get(k));
					}
					System.out.println(nums.get(nums.size() - 1));
					remove();
					return;
				}
				else{
					
					count++;
				}
			}
			remove();
			index ++;
		}
    }
}

public void mousePressed(){
	if(mouseX > 25 && mouseX < 125 && mouseY > 100 && mouseY < 200){
		mode = 1; 
	}
	if(mouseX > 175 && mouseX < 275 && mouseY > 100 && mouseY < 200){
		mode = 2;
		count = 0;
		index = 2;
	}
	redraw();
}