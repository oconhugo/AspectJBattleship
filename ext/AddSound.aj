package ext;

import java.io.File;
import java.io.IOException;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import battleship.model.*;

public aspect AddSound {
	/* isHit */
	/** Directory where audio files are stored. */
    private static final String SOUND_DIR = "src\\sounds\\";
    
    
	after(): execution(void notifyHit(Place, int)){
		playAudio("gun.wav");
	}
	after(): execution(void notifyShipSunk(Ship)){
		playAudio("sunk.wav");
	}
	/** Play the given audio file. Inefficient because a file will be 
     * (re)loaded each time it is played. */
    public static void playAudio(String filename) {
      try {
    	  File sound = new File(SOUND_DIR + filename);
          AudioInputStream audioIn = AudioSystem.getAudioInputStream(sound);
          Clip clip = AudioSystem.getClip();
          clip.open(audioIn);
          clip.start();
      } catch (UnsupportedAudioFileException 
            | IOException | LineUnavailableException e) {
          e.printStackTrace();
      }
    }
	
	/*isSunk*/
    
}
